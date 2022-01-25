

--3. en y�ksek de�eri getirme
--�rne�in d�n en �ok sipari� veren 3. m��terinizi bulmaya �al���yorsunuz.
 Select Top 1* From ( Select Top 3 Column_name,COUNT(*) as Sayi From Table_Name 
  Group By Column_name 
  Order By COUNT(*) Desc)  H
  Order By Sayi Asc


--Tabloda N th sat�r� getirme.
--Tabloda spesifik olarak 47.sat�rdaki datay� merak ettiniz mesela.
--Baz� tablolarda Identity column 1- 1 artmayabilir.
  Select * From 
  (Select Column_name,Row_Number()Over( order by Id desc )as SatirSayi 
   From Table_Name ) H
   Where SatirSayi=10


--A ve B tablolar�nda  ortak ID ye sahip data olsun.
--Biz sadece A tablosunda olan kay�tlar� bulmaya �al���yoruz
--A.ID: A tablosunun primary keyi
--B.ID: B tablosunu A tablosuna ba�layan Foreign Key

Select  * from  A
Left Join  B On A.Id=B.Id And B.ID is null


--Bulundu�umuz g�nden ay�n sona g�n�ne ka� g�n kald���n� veren sorgu
--G�n�n tarihi Getdate() ile al�n�r
--G�n�n tarihine 1ay eklenir
--YYYYMMDD format� i�in convert varchar 112 format� i�lemi yap�l�r.
--�lk 6 hane al�n�r 202202 gibi bir data elde edilir sonuan 01 eklenir ve 1 g�n ��kar�l�r. 
--��inde bulundu�umuz ay�n son g�n� elde edilmi� olur.
--Son g�nle �u anki g�n�n fark� al�n�r..


Select DateAdd(Month,1,Convert(varchar,Getdate()))
Select Datediff(day,Convert(varchar,Getdate()),Convert(varchar,DATEADD(Day,-1,SUBSTRING(Convert(varchar,DateAdd(Month,1,Convert(varchar,Getdate())),112),1,6)+'01'),112))

-- partition BY
--�rne�in bakkal�n�z var d�n su , un , ya� sat��lar�n�n toplam sat��lara oran�n� getirmek istiyorsunuz bu durumlarda partition by kullan�l�r..
--Group by ile fark� partition by sat�r bazl� gruplama sa�lar. �rne�in ya�sat���/Toplam sat��, un sat��� /toplam sat�� tek sat�rda g�rebilirsiniz.

SELECT B.ID,

           COUNT(*) over (partition BY B.ID ORDER BY B.ID desc),
		   COUNT(*) over (partition BY E.Id ORDER BY E.Id desc)

    FROM TABLE1 B
	Inner Join TABLE2 E on B.Id=E.ID



















