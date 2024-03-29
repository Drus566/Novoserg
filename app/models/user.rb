class User < ApplicationRecord
    has_many :microposts, dependent: :destroy
    has_many :news_items, dependent: :destroy

    attr_accessor :remember_token
    before_save { email.downcase! }
    validates :name, presence: true, length: {maximum: 30}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    class << self
        def digest(string)
            cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
            # Создает хэш токена из строки токена с определенными затратми cost
            BCrypt::Password.create(string, cost: cost)
        end

        # Генерирует токен
        def new_token
            SecureRandom.urlsafe_base64
        end
    end

    def remember
        self.remember_token = User.new_token
        # Создание хэша токена и запись этого хэша в БД
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    def authenticated?(remember_token)
        # Возвращает фалс если нет записи хэша токена в БД
        return false if remember_digest.nil?
        # Сравнивает запись хэша токена в БД с входящим в функцию токеном
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def forget
        # Стирает запись хэша токена из БД
        update_attribute(:remember_digest, nil)
    end
end