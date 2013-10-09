# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

LoanAttributeType.create([
    {id: 1, name: "citizenship", label: "Citizenship" },
    {id: 2, name: "program-eligible", label: "Program eligible" },
    {id: 3, name: "degree-eligible-graduate", label: "Degree eligible graduate" },
    {id: 4, name: "degree-eligible-undergraduate", label: "Degree eligible undergraduate" }
])

LoanAttribute.create([
    { id: 1, name: 'citizen', label: 'US Citizen', loan_attribute_type_id: 1, unit: '' },
    { id: 2, name: 'resident', label: 'Pernament Resident Alien', loan_attribute_type_id: 1, unit: '' },
    { id: 3, name: 'non-resident', label: 'Non-resident Alien', loan_attribute_type_id: 1, unit: '' },
    { id: 4, name: 'citizenship-other', label: 'Other', loan_attribute_type_id: 1, unit: '' },
    
    { id: 5, name: 'certificate', label: 'Certificate', loan_attribute_type_id: 2, unit: '' },
    { id: 6, name: 'associates', label: "Associate's", loan_attribute_type_id: 2, unit: '' },
    { id: 7, name: 'bachelors', label: "Bachelor's", loan_attribute_type_id: 2, unit: '' },
    { id: 8, name: 'masters', label: "Master's", loan_attribute_type_id: 2, unit: '' },
    { id: 9, name: 'doctorate', label: 'Doctorate', loan_attribute_type_id: 2, unit: '' },
    { id: 10, name: 'post-doctorate', label: 'Post-Doctorate', loan_attribute_type_id: 2, unit: '' },
    
    { id: 11, name: 'mba', label: 'MBA', loan_attribute_type_id: 3, unit: '' },
    { id: 12, name: 'law', label: 'Law', loan_attribute_type_id: 3, unit: '' },
    { id: 13, name: 'medicine', label: 'Medicine', loan_attribute_type_id: 3, unit: '' },
    { id: 14, name: 'graduate-business', label: 'Graduate Program - Bussines (not MBA)', loan_attribute_type_id: 3, unit: '' },
    { id: 15, name: 'graduate-engineering', label: 'Graduate Program - Engineering', loan_attribute_type_id: 3, unit: '' },
    { id: 16, name: 'graduate-dentistry', label: 'Graduate - Dentistry', loan_attribute_type_id: 3, unit: '' },
    { id: 17, name: 'graduate-nursing', label: 'Graduate - Nursing', loan_attribute_type_id: 3, unit: '' },
    { id: 18, name: 'graduate-pharmacy', label: 'Graduate - Pharmacy', loan_attribute_type_id: 3, unit: '' },
    { id: 19, name: 'graduate-other', label: 'Graduate - Other', loan_attribute_type_id: 3, unit: '' },
    
    { id: 20, name: 'accelerated-medical', label: 'Accelerated Medical', loan_attribute_type_id: 4, unit: '' },
    { id: 21, name: 'allopathic-medicine', label: 'Allopathic Medicine', loan_attribute_type_id: 4, unit: '' },
    { id: 22, name: 'architecture', label: 'Architecture', loan_attribute_type_id: 4, unit: '' }
  ])

LoanProduct.create([
    {id: 1, code: "SFL-1"},
    {id: 2, code: "WEL-1"},
    {id: 3, code: "COM-1"},
])

LoanProductAttribute.create([
    #SFL-1 attributes
    {loan_product_id: 1, loan_attribute_id: 1, value: 1},
    {loan_product_id: 1, loan_attribute_id: 2, value: 1},
    {loan_product_id: 1, loan_attribute_id: 3, value: 0},
    {loan_product_id: 1, loan_attribute_id: 4, value: 0},
    
    {loan_product_id: 1, loan_attribute_id: 5, value: 0},
    {loan_product_id: 1, loan_attribute_id: 6, value: 0},
    {loan_product_id: 1, loan_attribute_id: 7, value: 1},
    {loan_product_id: 1, loan_attribute_id: 8, value: 1},
    {loan_product_id: 1, loan_attribute_id: 9, value: 1},
    {loan_product_id: 1, loan_attribute_id: 10, value: 1},
    
    {loan_product_id: 1, loan_attribute_id: 11, value: 1},
    {loan_product_id: 1, loan_attribute_id: 12, value: 1},
    {loan_product_id: 1, loan_attribute_id: 13, value: 1},
    {loan_product_id: 1, loan_attribute_id: 14, value: 1},
    {loan_product_id: 1, loan_attribute_id: 15, value: 1},
    {loan_product_id: 1, loan_attribute_id: 16, value: 1},
    {loan_product_id: 1, loan_attribute_id: 17, value: 1},
    {loan_product_id: 1, loan_attribute_id: 18, value: 1},
    {loan_product_id: 1, loan_attribute_id: 19, value: 1},
    
    {loan_product_id: 1, loan_attribute_id: 20, value: 1},
    {loan_product_id: 1, loan_attribute_id: 21, value: 1},
    {loan_product_id: 1, loan_attribute_id: 22, value: 1},
    
    #WEL-1 attributes
    {loan_product_id: 2, loan_attribute_id: 1, value: 1},
    {loan_product_id: 2, loan_attribute_id: 2, value: 1},
    {loan_product_id: 2, loan_attribute_id: 3, value: 0},
    {loan_product_id: 2, loan_attribute_id: 4, value: 0},
    
    {loan_product_id: 2, loan_attribute_id: 5, value: 1},
    {loan_product_id: 2, loan_attribute_id: 6, value: 1},
    {loan_product_id: 2, loan_attribute_id: 7, value: 1},
    {loan_product_id: 2, loan_attribute_id: 8, value: 1},
    {loan_product_id: 2, loan_attribute_id: 9, value: 1},
    {loan_product_id: 2, loan_attribute_id: 10, value: 1},
    
    {loan_product_id: 2, loan_attribute_id: 11, value: 1},
    {loan_product_id: 2, loan_attribute_id: 12, value: 1},
    {loan_product_id: 2, loan_attribute_id: 13, value: 1},
    {loan_product_id: 2, loan_attribute_id: 14, value: 1},
    {loan_product_id: 2, loan_attribute_id: 15, value: 1},
    {loan_product_id: 2, loan_attribute_id: 16, value: 1},
    {loan_product_id: 2, loan_attribute_id: 17, value: 1},
    {loan_product_id: 2, loan_attribute_id: 18, value: 1},
    {loan_product_id: 2, loan_attribute_id: 19, value: 1},
    
    {loan_product_id: 2, loan_attribute_id: 20, value: 1},
    {loan_product_id: 2, loan_attribute_id: 21, value: 1},
    {loan_product_id: 2, loan_attribute_id: 22, value: 1},
        
    #COM-1 attributes
    {loan_product_id: 3, loan_attribute_id: 1, value: 1},
    {loan_product_id: 3, loan_attribute_id: 2, value: 1},
    {loan_product_id: 3, loan_attribute_id: 3, value: 0},
    {loan_product_id: 3, loan_attribute_id: 4, value: 0},
    
    {loan_product_id: 3, loan_attribute_id: 5, value: 0},
    {loan_product_id: 3, loan_attribute_id: 6, value: 0},
    {loan_product_id: 3, loan_attribute_id: 7, value: 0},
    {loan_product_id: 3, loan_attribute_id: 8, value: 1},
    {loan_product_id: 3, loan_attribute_id: 9, value: 0},
    {loan_product_id: 3, loan_attribute_id: 10, value: 0},
    
    {loan_product_id: 3, loan_attribute_id: 11, value: 1},
    {loan_product_id: 3, loan_attribute_id: 12, value: 0},
    {loan_product_id: 3, loan_attribute_id: 13, value: 0},
    {loan_product_id: 3, loan_attribute_id: 14, value: 0},
    {loan_product_id: 3, loan_attribute_id: 15, value: 0},
    {loan_product_id: 3, loan_attribute_id: 16, value: 0},
    {loan_product_id: 3, loan_attribute_id: 17, value: 0},
    {loan_product_id: 3, loan_attribute_id: 18, value: 0},
    {loan_product_id: 3, loan_attribute_id: 19, value: 0},
    
    {loan_product_id: 3, loan_attribute_id: 20, value: 0},
    {loan_product_id: 3, loan_attribute_id: 21, value: 0},
    {loan_product_id: 3, loan_attribute_id: 22, value: 0},
    
])