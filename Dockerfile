# Sử dụng Ruby 3.2.2
FROM ruby:3.2.2

# Cài đặt các gói cần thiết
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client

# Đặt thư mục làm việc cho ứng dụng Rails
WORKDIR /app

# Sao chép Gemfile và Gemfile.lock vào Docker image
COPY Gemfile Gemfile.lock ./

# Cài đặt các gem
RUN bundle install

# Sao chép toàn bộ mã nguồn ứng dụng vào container
COPY . .

# Expose cổng mặc định của Rails
EXPOSE 3000

# Khởi động server khi container khởi động
CMD ["rails", "server", "-b", "0.0.0.0"]
