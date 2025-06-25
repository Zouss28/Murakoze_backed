# Murakoze Recommender API

A robust backend API for the Murakoze Recommendations Platform, helping users discover, review, and interact with local businesses in Rwanda. Built for scalability, security, and developer productivity.

---

## 🚀 Features
- **JWT Authentication** (access & refresh tokens)
- **Google OAuth (planned)**
- **User registration, login, email verification, and profile management**
- **Institution listing, filtering, and search (by category, rating, amenities, price, open status, etc.)**
- **Review system with moderation, reactions, and image uploads**
- **Email notifications (Nodemailer)**
- **Swagger API documentation**
- **Production-ready Docker & Railway deployment**

---

## 🛠️ Tech Stack
- **Node.js** + **Express.js** (API server)
- **Prisma ORM** (MariaDB/MySQL)
- **JWT** (auth)
- **Nodemailer** (email)
- **Fuse.js** (fuzzy search)
- **Multer** (file uploads)
- **Swagger** (API docs)
- **Docker** (containerization)
- **Railway** (deployment)

---

## 📁 Folder Structure
```
├── src/
│   ├── controllers/      # Route controllers (business logic)
│   ├── services/         # DB/service logic
│   ├── routes/           # Express route definitions
│   ├── middleware/       # Auth, error handling, etc.
│   ├── validators/       # Input validation (express-validator)
│   ├── utils/            # Helpers (email, tokens, etc.)
│   ├── filter/           # Filtering logic (e.g., openNow)
│   ├── generated/prisma/ # Prisma client
│   └── templates/        # Email templates
├── prisma/               # Prisma schema & migrations
├── uploads/              # Uploaded images
├── Dockerfile            # Docker config
├── docker-compose.yml    # Multi-service orchestration
├── .env.example          # Example environment config
└── README.md
```

---

## ⚙️ Setup & Configuration

### Prerequisites
- Node.js v16+
- MariaDB or MySQL
- [Railway](https://railway.app/) account (for deployment)

### 1. Clone & Install
```bash
git clone https://gitlab.wiredin.rw/internal-projects/murakoze/recommender-api.git
cd recommender-api
npm install
```

### 2. Environment Variables
Copy and edit `.env.example`:
```bash
cp .env.example .env
```
Set your DB URL, JWT secrets, email credentials, etc.

### 3. Prisma Setup
```bash
npx prisma generate
npx prisma migrate dev
```

### 4. Start the Server
```bash
npm start
```

---

## 🧑‍💻 Usage

### Authentication
- **Sign up:** `POST /api/auth/signup`
- **Login:** `POST /api/auth/login`
- **Refresh token:** (planned)
- **Delete account:** `DELETE /api/auth/delete-account`

### Profile
- **Get dashboard:** `GET /api/profile/dashboard`
- **Update profile:** `PUT /api/profile/dashboard/update`
- **Upload image:** `PUT /api/profile/update_image`

### Institutions
- **List categories:** `GET /api/institutions`
- **List by category:** `GET /api/institutions/:category_id`
- **View details:** `GET /api/institutions/:id/view`

### Search & Filter
- **Fuzzy search:** `GET /api/search/institutions?q=pharmacy&page=1&pageSize=5`
- **Filter by category:** `GET /api/search/:category_id?filter=rating&amenities=1,2&price=$$&open=true`
- **Top amenities:** `GET /api/search/list/amenity?category_id=1`

### Reviews
- **Submit review:** `POST /api/review/:institution_id` (multipart/form-data)
- **Recent reviews:** `GET /api/review/recent`
- **Review reactions:** `POST /api/review/:review_id/reaction`

### API Docs
- **Swagger UI:** `GET /api-docs`

---

## 🔒 Security & Production
- **Secrets:** All sensitive config via `.env` (never hardcode!)
- **CORS:** Restrict origins in production
- **Helmet:** Use for HTTP header security
- **Rate limiting:** Recommended for auth endpoints
- **Error handling:** Centralized, no stack traces in responses
- **JWT:** Use httpOnly cookies for refresh tokens (planned)
- **Audit:** Run `npm audit` regularly

---

## 🤝 Contributing
1. Fork & clone the repo
2. Create a feature branch (`git checkout -b your initials/your-feature-number`)
3. Commit with clear messages (see existing format)
4. Open a pull request
5. Follow code style and add tests where possible

---

## 🗺️ Roadmap
- [x] Modular controllers/services/validators
- [x] Review reactions & moderation
- [x] Advanced search & filtering
- [ ] Google OAuth login
- [ ] Admin dashboard
- [ ] Rate limiting & security hardening
- [ ] CI/CD pipeline

---

## 👥 Credits
- **Alain Iyakaremye** – Backend Developer
- **Gift Dave Furaha** – Backend Developer
- **Bolingo Baudoin** – Frontend Developer
- **WiredIn** – Technical guidance & support

---

## 📄 License
MIT