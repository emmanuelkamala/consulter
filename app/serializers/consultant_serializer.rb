class ConsultantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :email, :profession
end