require "./myrep/version"
require 'httparty'
require '../spec/spec_helper'

module Myrep
  class Representative
    include HTTParty
    base_uri 'whoismyrepresentative.com'
    default_params :output => 'json'
    format :json
    
    #returns data on both representatives and senators by zipcode
    #name, state, district, phone, office, website
    def self.mems_by_zip(zip)
      get('/getall_mems.php', :query => {:zip => zip})
    end
    #returns data on representatives by lastname
    #name, state, district, phone, office, website
    def self.getall_reps_byname(name)
      get('/getall_reps_byname.php', :query => {:name => name})
    end
    #returns data on representatives by state
    #name, state, district, phone, office, website
    def self.get_reps_by_state(state)
      get('/getall_reps_bystate.php', :query => {:state => state})
    end
    #returns data on senators by lastname
    #name, state, district, phone, office, website
    def self.getall_sens_byname(name)
      get('/getall_sens_byname.php', :query => {:name => name})
    end
    #returns data on senators by state
    #name, state, district, phone, office, website
    def self.getall_send_bystate(state)
      get('/getall_sens_bystate.php', :query => {:state => state})
    end
    
   end
   #returns data and parses the reponse for formatting
   ret = Representative.mems_by_zip(20721)
   data = ret.parsed_response["results"]
   data.each do |i|
     puts i['name']
     puts i['state'] 
     puts i['district']
     puts i['phone']
     puts i['office']
     puts i['website']   
   end
 
end
