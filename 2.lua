inf=1e20

function delta(a,b,p)
  for i=1,#history do if history[i]==a..b then return inf end end
  table.insert(history,a..b)
  if a==b then return 0 end
  for i=1,#p do if p[i]==a..b then return 1 end end
  local x={}
  for i=1,#p do if p[i]:sub(1,1)==a then table.insert(x,delta(p[i]:sub(2,2),b,p))end end
  if #x==0 then return inf end
  return 1+math.min(unpack(x))
end

T=io.read()
s={} 
p={}
K={}
for i=1,T do
  s[i]=io.read()
  K[i]=io.read()
  p[i]={}
  for j=1,K[i] do p[i][j]=io.read()end
end

for i=1,T do
n=inf
  for j=65,90 do
    b=string.char(j)
    m=0
    for k=1,#s[i] do history={} m=m+delta(s[i]:sub(k,k),b,p[i])end
    if m<n then n=m end  
  end
if n>=inf then n=-1 end
io.write('Case #',i,': ', n,'\n')
end
