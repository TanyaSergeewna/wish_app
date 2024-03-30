import SwiftUI

struct ContentView: View
{
    var body: some View
    {
            NavigationView
            {
                ZStack
                {
                    Image("startScreen")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    VStack
                    {
                        Spacer().frame(height: UIScreen.main.bounds.height - 270)
                        NavigationLink(destination: ProfileScreen())
                        {
                            Text("Регистрация")
                                .padding(.vertical, 12)
                                .padding(.horizontal, 116)
                                .background(Color(red: 0/255, green: 0/255, blue: 255/255))
                                .font(.custom("Montserrat-SemiBold", size: 16))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    
                    VStack
                    {
                        Spacer().frame(height: UIScreen.main.bounds.height - 170)
                        NavigationLink(destination: EnterScreen())
                        {
                            Text("Уже есть аккаунт? Войти")
                                .font(.custom("Montserrat-SemiBold", size: 14))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
}

struct ProfileScreen: View
{
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthDate = Date()
    
    @State private var selectedGender = 0
    @State private var selectedGenderString = ""
    
    let genders = ["Женщина", "Мужчина"]
    
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                Image("profileScreen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack
                {
                    Text("Привет!")
                        .font(.custom("MontserratAlternates-SemiBold", size: 28))
                        .foregroundColor(.black)
                        .offset(y:-180)
                }
                
                VStack
                {
                    Text("Давай знакомится, мы команда wish!\nЗаполни профиль, чтобы мы узнали тебя")
                        .font(.custom("Montserrat-Regular", size: 16))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .offset(y:-120)
                }
                
                VStack
                {
                    Spacer().frame(height: UIScreen.main.bounds.height - 400)
                    Section()
                    {
                        TextField("Имя", text: $firstName)
                        TextField("Фамилия", text: $lastName)
                        DatePicker("День рождения", selection: $birthDate, displayedComponents: .date)
                        Picker("Пол", selection: $selectedGenderString)
                                {
                                    ForEach(genders, id: \.self)
                                    {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(SegmentedPickerStyle())
                                .foregroundColor(selectedGenderString == "Male" ? Color.clear : Color.blue)
                    }
                    .frame(width: UIScreen.main.bounds.width - 60)
                    .offset(y:-200)
                    VStack
                    {
                        NavigationLink(destination: PasswordScreen())
                        {
                            Button(action:{
                                print("Имя:\(firstName)")
                                print("Фамилия:\(lastName)")
                                print("Дата рождения:\(birthDate)")
                                print("Пол:\(selectedGenderString)")
                            })
                            {
                                Text("Далее")
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 140)
                            .background(Color(red: 0/255, green: 0/255, blue: 255/255))
                            .font(.custom("Montserrat-SemiBold", size: 16))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct EnterScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("exitScreen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack {
                    Text("С возвращением!")
                        .font(.custom("MontserratAlternates-SemiBold", size: 28))
                        .foregroundColor(.black)
                        .offset(y:120)
                    
                    Text("Мы снова приветствуем тебя в wish,\nвведи логин и пароль для входа")
                        .font(.custom("Montserrat-Regular", size: 16))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .offset(y:160)
                    
                    VStack
                    {
                        TextField("Логин", text: $username)
                            .padding()
                            .background(Color.clear)
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                        
                        SecureField("Пароль", text: $password)
                            .padding()
                            .background(Color.clear)
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                    }
                    .offset(y: 190)
                    
                    Spacer().frame(height: UIScreen.main.bounds.height - 400)
                    
                    
                        Text("Войти")
                            .padding(.vertical, 12)
                            .padding(.horizontal, 142)
                            .background(Color(red: 0/255, green: 0/255, blue: 255/255))
                            .font(.custom("Montserrat-SemiBold", size: 16))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct AccountScreen: View
{
    @State private var selectedGender = 0
    @State private var selectedGenderString = ""
    
    let genders = ["Женщина", "Мужчина"]
    
    @State private var isOn = false
    
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
            
                Image("accountScreen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack
                {
                    Image("notifications")
                        .offset(x: 160, y: -350)
                }
                VStack
                {
                    Text("Имя Фамилия")
                        .font(.custom("Montserrat-SemiBold", size: 23))
                        .foregroundColor(.black)
                        .offset(y:-120)
                    Text("@user000")
                        .font(.custom("Montserrat-Medium", size: 16))
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .offset(y:-110)
                    Text("Дата рождения")
                        .font(.custom("Montserrat-SemiBold", size: 16))
                        .foregroundColor(.black)
                        .offset(x:-110, y:-70)
                }
                VStack
                {
                    Picker("Пол", selection: $selectedGenderString)
                            {
                                ForEach(genders, id: \.self)
                                {
                                    Text($0)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .foregroundColor(selectedGenderString == "Male" ? Color.clear : Color.blue)
                }
                .frame(width: UIScreen.main.bounds.width - 32)
                .offset(y:0)
                VStack
                {
                    Text("Обо мне")
                        .font(.custom("Montserrat-SemiBold", size: 16))
                        .foregroundColor(.black)
                        .offset(x:-140, y:50)
                    Text("Информация об пользователе")
                        .font(.custom("Montserrat-Medium", size: 16))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.trailing)
                        .opacity(0.5)
                        .offset(x:-60, y:80)
                }
                VStack
                {
                    Text("Скрыть дарителя")
                        .font(.custom("Montserrat-SemiBold", size: 16))
                        .foregroundColor(.black)
                        .offset(x:-100, y:200)
                    
                    Toggle(isOn ? "" : "", isOn: $isOn)
                        .offset(x:-150, y:165)
                }
                VStack
                {
                    Text("Вы не узнаете кто забронировал ваше желание")
                        .font(.custom("Montserrat-Medium", size: 12))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.trailing)
                        .opacity(0.5)
                        .offset(x:-40, y:210)
                }
                VStack
                {
                    Spacer().frame(height: UIScreen.main.bounds.height - 240)
                    NavigationLink(destination: ContentView())
                    {
                        Text("Выйти из аккаунта")
                            .font(.custom("Montserrat-SemiBold", size: 14))
                            .foregroundColor(.black)
                            .offset(x:-100)
                    }
                }
                VStack
                {
                    Spacer().frame(height: UIScreen.main.bounds.height - 130)
                    NavigationLink(destination: IdeaScreen())
                    {
                        Image("ideaButton")
                            .offset(x:-150)
                            .padding(10)
                    }
                }
                VStack
                {
                    Spacer().frame(height: UIScreen.main.bounds.height - 130)
                    NavigationLink(destination: WishScreen())
                    {
                        Image("wishButton")
                            .offset(x:25)
                            .padding(10)
                    }
                }
                VStack
                {
                    Spacer().frame(height: UIScreen.main.bounds.height - 130)
                    NavigationLink(destination: WishScreen())
                    {
                        Image("friendsButton")
                            .offset(x:-65)
                            .padding(10)
                    }
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct WishScreen: View
{
    @State private var showModal: Bool = false
    @State private var textInput: String = ""
    @State private var navigationToWishList = false
    var body: some View
    {
        ZStack
        {
            Image("wishListScreen")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack
            {
                
                Spacer().frame(height: UIScreen.main.bounds.height - 300)
                Button(action:
                        {
                    self.showModal.toggle()
                })
                {
                    Text("+ Добавить WishList")
                        .font(.custom("Montserrat-SemiBold", size: 16))
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 100)
                        .background(Color(red:0/255, green: 0/255, blue: 255/255))
                        .cornerRadius(10)
                }
                .sheet(isPresented: $showModal)
                {
                    VStack
                    {
                        TextField("Название", text: self.$textInput)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button("Закрыть")
                        {
                            self.showModal.toggle()
                        }
                        .offset(x:60, y:23)
                        Button("Создать")
                        {
                            self.navigationToWishList=true
                        }
                        .fullScreenCover(isPresented: $navigationToWishList, content: WishListScreen.init)
                        .offset(x: -60)
                    }
                    .padding()
                    
                }
            }
            VStack
            {
                Spacer().frame(height: UIScreen.main.bounds.height - 130)
                NavigationLink(destination: IdeaScreen())
                {
                    Image("ideaButton")
                        .offset(x:-150)
                        .padding(10)
                }
            }
            VStack
            {
                Spacer().frame(height: UIScreen.main.bounds.height - 130)
                NavigationLink(destination: WishScreen())
                {
                    Image("accountButton")
                        .offset(x:140)
                        .padding(10)
                }
            }
            VStack
            {
                Spacer().frame(height: UIScreen.main.bounds.height - 130)
                NavigationLink(destination: WishScreen())
                {
                    Image("friendsButton")
                        .offset(x:-65)
                        .padding(10)
                }
            }
        }
    }
}

struct WishListScreen: View
{
    @State private var showModal: Bool = false
    @State private var isShowingTextFields = false
    @State private var textInput: String = ""
    @State private var link: String = ""

    var body: some View
    {
        ZStack
        {
        
            Image("wishListScreen")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack
            {
                Spacer().frame(height: UIScreen.main.bounds.height - 130)
                NavigationLink(destination: IdeaScreen())
                {
                    Image("ideaButton")
                        .offset(x:-150)
                        .padding(10)
                }
            }
            VStack
            {
                Spacer().frame(height: UIScreen.main.bounds.height - 130)
                NavigationLink(destination: WishScreen())
                {
                    Image("friendsButton")
                        .offset(x:-65)
                        .padding(10)
                }
            }
            VStack
            {
                Spacer().frame(height: UIScreen.main.bounds.height - 130)
                NavigationLink(destination: WishScreen())
                {
                    Image("accountButton")
                        .offset(x:140)
                        .padding(10)
                }
            }
            VStack
            {
                Text("Название вишлиста")
                    .font(.custom("MontserratAlternates-SemiBold", size: 28))
                    .foregroundColor(.black)
                    .offset(y:-300)
            }
            VStack
            {
                Spacer().frame(height: UIScreen.main.bounds.height - 300)
                Button(action:{
                    self.showModal.toggle()
                })
                {
                    Text("+")
                        .font(.custom("MontserratAlternates-SemiBold", size: 40))
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color(red:0/255, green: 0/255, blue: 255/255))
                        .cornerRadius(10)
                }
                .sheet(isPresented: $showModal)
                {
                   VStack
                    {
                        TextField("Название", text: self.$textInput)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Ссылка", text: self.$link)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Button("Закрыть")
                        {
                            self.showModal.toggle()
                        }
                        .offset(x:60, y:23)
                        Button(action:
                        {
                            self.showModal.toggle()
                            isShowingTextFields.toggle()
                        })
                        {
                            Text("Создать")
                        }
                        .offset(x:-50)
                    }
                    .padding()
                }
            }
            VStack
            {
                if isShowingTextFields
                {
                    Text("Название предмета")
                        .padding()
                    Text("Ссылка")
                        .padding()
                }
            }
        }
    }
}



struct IdeaScreen: View
{
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
            
                Image("ideaScreen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct FriendScreen: View
{
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
            
                Image("friendsScreen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct PasswordScreen: View
{
    @State private var userName:String = ""
    @State private var phoneNumber:String = ""
    @State private var password:String = ""
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                Image("passwordScreen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack
                {
                    Text("Защити себя")
                        .font(.custom("MontserratAlternates-SemiBold", size: 28))
                        .foregroundColor(.black)
                        .offset(y:-180)
                }
                
                VStack
                {
                    Text("Для защиты учетной записи введи\nномер и придумай логин и пароль")
                        .font(.custom("Montserrat-Regular", size: 16))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .offset(y:-120)
                }
                
                VStack
                {
                    Spacer().frame(height: UIScreen.main.bounds.height - 350)
                    Section()
                    {
                        TextField("Логин", text:$userName)
                        TextField("Номер Телефона", text:$phoneNumber)
                        TextField("Пароль", text:$password)
                    }
                    .frame(width: UIScreen.main.bounds.width - 60)
                    .offset(y:-200)
                    VStack
                    {
                        NavigationLink(destination: AboutMeScreen())
                        {
                            Button(action:{
                                print("Логин:\(userName)")
                                print("Номер телефона:\(phoneNumber)")
                                print("Пароль:\(password)")
                            })
                            {
                                Text("Далее")
                            }
                            .padding(.vertical, 12)
                            .padding(.horizontal, 140)
                            .background(Color(red: 0/255, green: 0/255, blue: 255/255))
                            .font(.custom("Montserrat-SemiBold", size: 16))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct AboutMeScreen: View
{
    @State private var userInfo:String = ""
    @State private var selectedCategories = Set<String>()
    let categories = ["Спорт", "Искусство", "Книги", "Фильмы/Сериалы"]
    
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                Image("aboutMeScreen")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                VStack
                {
                    Text("Опиши себя")
                        .font(.custom("MontserratAlternates-SemiBold", size: 28))
                        .foregroundColor(.black)
                        .offset(y:-180)
                }
                
                VStack
                {
                    Text("Добавь немного информации о себе,\nтогда подборки точно попадут в цель")
                        .font(.custom("Montserrat-Regular", size: 16))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .offset(y:-120)
                }
                
                VStack
                {
                    Spacer().frame(height: UIScreen.main.bounds.height - 350)
                    Section()
                    {
                        TextField("Расскажи о себе", text:$userInfo)
                        List(categories, id: \.self, selection: $selectedCategories)
                        {
                            category in
                            HStack
                            {
                                Text(category)
                                Spacer()
                                if self.selectedCategories.contains(category)
                                {
                                    Image(systemName: "checkmark")
                                  
                                 }
                             }
                         }
                        .listStyle(PlainListStyle())
                    }
                    .frame(width: UIScreen.main.bounds.width - 60)
                    .offset(y:-150)
                }
                
                VStack
                {
                    Spacer().frame(height: UIScreen.main.bounds.height - 250)
                    NavigationLink(destination: AccountScreen())
                        {
                        Text("Завершить")
                        .padding(.vertical, 12)
                        .padding(.horizontal, 120)
                        .background(Color(red: 0/255, green: 0/255, blue: 255/255))
                        .font(.custom("Montserrat-SemiBold", size: 16))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
                
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



