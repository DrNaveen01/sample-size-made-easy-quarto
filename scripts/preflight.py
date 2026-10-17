"""Validate basic manuscript structure without needing Quarto or R."""
from pathlib import Path
import re
from collections import Counter
root=Path(__file__).resolve().parent.parent
chapter_files=sorted((root/'chapters').glob('*.qmd'))
assert len(chapter_files)==36, f"Expected 36 chapters, got {len(chapter_files)}"
assert len(list((root/'appendices').glob('*.qmd')))==5
bib=(root/'references.bib').read_text(encoding='utf8')
known=set(re.findall(r'@\w+\{([A-Za-z0-9_:-]+),',bib))
refs=[]
for f in list(root.rglob('*.qmd')):
    s=f.read_text(encoding='utf8')
    assert s.count(':::')%2==0, f"Unpaired markdown div in {f}"
    refs.extend(re.findall(r'(?<!\w)@(sec-[a-z0-9-]+)',s))
    for r in re.findall(r'(?<!\w)@([a-z][a-z0-9]+\d{4})',s):
        assert r in known,(f,r)
    assert not s.count('TODO-UNVALIDATED'),f
ids=set(re.findall(r'\{#(sec-[a-z0-9-]+)\}', '\n'.join(f.read_text(encoding='utf8') for f in root.rglob('*.qmd'))))
assert set(refs).issubset(ids),set(refs)-ids
for f in chapter_files:
    s=f.read_text(encoding='utf8')
    assert 'Learning objectives' in s and 'Common error' in s and 'Worked example 2' in s,f
assert (root/'assets/precision-sensitivity.png').exists()
print(f'PASS: {len(chapter_files)} chapters, 5 appendices, {len(known)} bibliography entries, {len(refs)} chapter links')
