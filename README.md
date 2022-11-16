# Tugas 7
# Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateless widgets merupakan widgets yang tidak berubah sedangkan stateful widget adalah widget yang dapat berubah contohnya pada saat terjadi suatu event atau user interaction. Sehingga perbedaan widget tersebut adalah stateless widget merupakan widget statis sedangkan stateful widget merupakan widget dinamis.

# Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
1. FloatingActionButton: Membuat clickable button
2. Text: Menampilkan text pada aplikasi
3. Row: Digunakan untuk meletakan child pada Row ke kolom yang berbeda-beda.
4. Padding: Digunakan untuk styling (memberikan space pada text button dengan memperluas area)
5. Container: Digunakan untuk mengumpulkan beberapa widgets

# Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
setState() berguna untuk membuat flutter mengetahui jika ada perubahan yang terjadi pada aplikasi sehingga akan terjadi rebuild dan ditampilkan juga perubahan yang sudah diberlakukan. Contoh variabel yang terdampak adalah _counter saat button add / minus ditekan.

# Jelaskan perbedaan antara const dengan final.
Perbedaan utama dari const dan final pada dart adalah nilai atau value dari const harus diketahui saat compile time sedangkan value dari final harus diketahui saat run time.

# Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Create project with flutter create ```counter_7```
2. Membuat container untuk mengumpulkan button add dan minus
3. Memberikan padding untuk mendesign button
4. Menggunakan ```FloatingActionButtonLocation.centerFloat``` untuk menetapkan lokasi buttons
5. Menggunakan Row untuk melakukan inline buttons
6. Meletakan extra space between row di center menggunakan ```mainAxisAlignment: MainAxisAlignment.spaceBetween```
7. Pada children row membuat 2 button menggunakan widget ```FloatingActionButton``` untuk add dan minus.
8. Menggunakan if untuk mengecek jika counter bukan nol, jika bukan nol maka generate button minus (show), selain itu jangan generate (hide) -> Untuk bonus
9. Menambahkan ```_incrementCounter``` pada button add dan ```_decrementCounter``` pada button minus untuk mengaplikasikan on click event
10. Mengganti tulisan ```You have pushed the button this many times``` menjadi sebuah variabel ```_status``` yang di set valuenya sebagai GENAP dengan Colors yang di set sebagai variabel ```_color``` yang di set valuenya sebagai Colors.red.
11. Memodifikasi fungsi ```_incrementCounter``` agar dapat mengecek nilai variabel counter saat ini dengan if else, jika mod 2 dari counter sama dengan 1 (ganjil) maka ganti ```_status``` menjadi GANJIL dan ganti variabel ```_color``` menjadi Colors.lightBlue.
12. Membuat fungsi ```_decrementCounter``` yang jika counter masih berada diatas nilai 0 maka dapat mengurangi tapi jika sama dengan 0 maka tidak akan melakukan apapun. Diimplementasikan juga modifikasi yang sama pada poin 11.
13. Mengganti title program menjadi ```Program Counter```.

# Tugas 8
# Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.
Navigator push hanya akan mempush sebuah component pada stack sedangkan pushReplacement akan mereplace component stack yang ada di paling atas dengan component baru.

# Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
1. Card: Mendisplay child dalam bentuk card
2. ListTile: Mendisplay child dalam bentuk list
3. Drawer: Sidebar / burger
4. AppBar: Display top bar
5. Form: Area for form input
6. TextFormField: Tempat untuk input dalam bentuk text
7. DropdownButton: Tempat untuk input dalam bentuk dropdown

# Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
1. onPressed: event jika terjadi press/tekanan
2. onTap: event jika terjadi klik
3. onChanged: event jika terjadi perubahan

# Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Navigator menggunakan sistem stack dimana top of stack yang akan di display pada user. Maka dari itu proses penggantian halaman digunakan method push/pop untuk mengganti halaman.

# Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat 2 file baru bernama add.dart dan data.dart
2. Mengisi kedua file tersebut dengan default template dan constructor.
3. Mengisi build widget masing-masing file dengan sidebar/burger. Menggunakan navigatior untuk navigate antar 3 page.
4. Pada add.dart membuat widget form dengan 2 isi widget TextFormField dan 1 DropdownButton.
5. Membuat submit button yang akan menghandle saat data ingin di save oleh user.
6. Pada data.dart menggunakan widget card untuk mendisplay data dari add.dart. 
7. Memodifikasi constructor ketiga file untuk dapat menerima arguments yang akan di parse (Agar data tidak hilang).
7. Memodifikasi navigator destination agar memiliki argument pass.