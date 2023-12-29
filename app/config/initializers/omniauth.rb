# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :google_oauth2,
    ENV.fetch('GOOGLE_CLIENT_ID'),
    ENV.fetch('GOOGLE_CLIENT_SECRET')
  )
end

if ENV.fetch('USE_FAKE_AUTH', false) == 'true'
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
    { provider: 'google_oauth2',
      uid: '971654372',
      info: { name: 'Kira Aufderhar', first_name: 'Kira', last_name: 'Aufderhar', email: 'kira.aufderhar@hane.example',
              image: 'https://via.placeholder.com/300x300.png' },
      credentials: { token: '58855e6f8b6244a840d84fc8d04d600c', refresh_token: '3950d5bdce313e877477b49ad7e6e159',
                     expires_at: 1_711_079_383, expires: true },
      extra: { raw_info: { sub: '971654372',
                           email: 'kira.aufderhar@hane.example',
                           email_verified: 'false',
                           name: 'Kira Aufderhar',
                           given_name: 'Kira',
                           family_name: 'Aufderhar',
                           profile: 'https://plus.google.com/971654372',
                           picture: 'https://via.placeholder.com/300x300.png',
                           gender: 'female',
                           birthday: '1933-12-07',
                           locale: 'en',
                           hd: 'hilll, kub and torphy.com' },
               id_info: { iss: 'accounts.google.com',
                          at_hash: '29b4c4a52b563e5180129a4c6124ed7e',
                          email_verified: true,
                          sub: '5356416879152227982709062457',
                          azp: 'APP_ID',
                          email: 'kira.aufderhar@hane.example',
                          aud: 'APP_ID',
                          iat: 1_721_582_059,
                          exp: 1_732_553_187,
                          openid_id: 'https://www.google.com/accounts/o8/id?id=971654372' } } }
  )
end
