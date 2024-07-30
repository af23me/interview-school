FROM surnet/alpine-wkhtmltopdf:3.18.0-0.12.6-full AS wkhtmltopdf_image

FROM ruby:3.2.2-alpine3.18 AS base

WORKDIR /usr/src/app

RUN apk add --no-cache git \
                       nodejs \
                       gcompat \
                       tzdata \
                       postgresql-libs \
                       pkgconfig \
                       imagemagick \
                       imagemagick-dev \
                       imagemagick-libs \
                       font-noto

COPY Gemfile* ./

RUN apk add --no-cache gcompat tzdata postgresql-libs && \
    apk add --update-cache --no-cache --virtual .build-deps g++ make linux-headers postgresql-dev \
    && bundle install --jobs $(nproc) --retry 3 \
    && rm -rf /usr/local/bundle/cache/*.gem \
    && find /usr/local/bundle/gems/ -name "*.c" -delete \
    && find /usr/local/bundle/gems/ -name "*.o" -delete \
    && apk --purge del .build-deps

COPY --from=wkhtmltopdf_image /bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf

COPY . .

CMD ["bin/bundle", "exec", "puma", "--log-requests"]
