function kinda(a)
  if a=='A' or a=='E' or a=='I' or a=='O'or a=='U' then
     return 0 else return 1
  end
end

function delta(a,b)
  if a==b then return 0 end
  if kinda(a)==kinda(b)then
     return 2 else return 1
  end
end

io.write"Number of birthdays T = "
T=io.read()
s={} 
for i=1,T do s[i]=io.read()end

for i=1,T do
l=#s[i]
n=2*l
  for j=65,90 do
    a=string.char(j)
    m=0
    for k=1,l do m=m+delta(a,s[i]:sub(k,k))end
    if m<n then n=m end
  end
io.write('Case #',i,': ', n,'\n')
end
