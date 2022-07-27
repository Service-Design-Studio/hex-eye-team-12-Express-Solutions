json.services do 
    json.array!(@services) do |service|
        json.name service.service
        json.details service.details
        json.digital_time service.digital_time
        json.branch_time service.branch_time
        json.category service.category
        json.migratable service.migratable
    end
end


