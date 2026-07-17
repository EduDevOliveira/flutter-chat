# Flutter Chat

Aplicação de chat em tempo real desenvolvida em Flutter utilizando Firebase Authentication e Cloud Firestore.

## Funcionalidades

- Cadastro de usuário
- Login com e-mail e senha
- Lista de usuários online
- Chat em tempo real (sala única)
- Logout
- Atualização automática de status online/offline
- Mensagens em tempo real utilizando Cloud Firestore

---

## Tecnologias

- Flutter
- Riverpod
- Firebase Authentication
- Cloud Firestore
- Freezed
- Json Serializable
- ResultDart

---

## Arquitetura

O projeto foi desenvolvido utilizando **Clean Architecture**, dividido em:

```
lib/
├── app/
├── core/
│   ├── exceptions/
│   ├── failures/
│   ├── validators/
│   └── utils/
│
├── features/
│   ├── auth/
│   ├── chat/
│   └── users/
```

Cada feature é organizada em:

```
data/
domain/
presentation/
```

Onde:

- **Data**
    - Datasources
    - Models
    - Repositories

- **Domain**
    - Entities
    - Repository Contracts
    - UseCases

- **Presentation**
    - Pages
    - Controllers
    - Providers
    - States
    - Widgets

---

## Gerenciamento de Estado

Foi utilizado **Riverpod (Code Generation)** para gerenciamento de estado.

Cada Controller possui seu respectivo State utilizando **Freezed**.

---

## Tratamento de Erros

A aplicação utiliza:

- AppException
- AppFailure
- FailureMapper
- ResultDart

para separar erros técnicos das mensagens apresentadas ao usuário.

---

# Configurando o Firebase

## 1 - Criar um projeto

Acesse:

https://console.firebase.google.com

Crie um novo projeto.

---

## 2 - Habilitar Authentication

Authentication

↓

Sign-in Method

↓

Email/Password

↓

Enable

---

## 3 - Criar o Firestore

Cloud Firestore

↓

Create Database

↓

Production Mode

---

## 4 - Registrar o aplicativo Flutter

Adicionar:

- Android
- iOS (opcional)

---

## 5 - Instalar FlutterFire CLI

```bash
dart pub global activate flutterfire_cli
```

---

## 6 - Configurar

```bash
flutterfire configure
```

Será gerado:

```
lib/firebase_options.dart
```

---

## 7 - Regras do Firestore

### users

```javascript
match /users/{userId} {
  allow read, write: if request.auth != null;
}
```

### messages

```javascript
match /messages/{messageId} {
  allow read, write: if request.auth != null;
}
```

---

## Executando o projeto

Instalar dependências

```bash
flutter pub get
```

Gerar os arquivos

```bash
dart run build_runner build --delete-conflicting-outputs
```

Executar

```bash
flutter run
```

---

## Arquivos que NÃO devem ser enviados, porém por ser um teste os arquivos vão para o repositório também!

Adicionar ao `.gitignore`:

```
android/app/google-services.json

ios/Runner/GoogleService-Info.plist

lib/firebase_options.dart
```

O projeto deverá ser configurado novamente utilizando o FlutterFire CLI, caso não tem os arquivos mencionados acima.

---

## Decisões de arquitetura

- Clean Architecture
- Separação por Features
- Riverpod com Code Generation
- Estados utilizando Freezed
- Tratamento de erros utilizando ResultDart
- Firebase isolado na camada Data através de DataSources, permitindo substituição futura por outra fonte de dados sem impacto nas camadas Domain e Presentation.
