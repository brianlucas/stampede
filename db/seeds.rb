# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

LoanAttribute.create([
    { id: 1, name: 'citizen', label: 'US Citizen', tags: 'citizenship', unit: '' },
    { id: 2, name: 'resident', label: 'Pernament Resident Alien', tags: 'citizenship', unit: '' },
    { id: 3, name: 'non-resident', label: 'Non-resident Alien', tags: 'citizenship', unit: '' },
    { id: 4, name: 'citizenship-other', label: 'Other', tags: 'citizenship', unit: '' },
    
    { id: 5, name: 'certificate', label: 'Certificate', tags: 'program-eligible', unit: '' },
    { id: 6, name: 'associates', label: "Associate's", tags: 'program-eligible', unit: '' },
    { id: 7, name: 'bachelors', label: "Bachelor's", tags: 'program-eligible', unit: '' },
    { id: 8, name: 'masters', label: "Master's", tags: 'program-eligible', unit: '' },
    { id: 9, name: 'doctorate', label: 'Doctorate', tags: 'program-eligible', unit: '' },
    { id: 10, name: 'post-doctorate', label: 'Post-Doctorate', tags: 'program-eligible', unit: '' },
    
    { id: 11, name: 'mba', label: 'MBA', tags: 'degree-eligible graduate', unit: '' },
    { id: 12, name: 'law', label: 'Law', tags: 'degree-eligible graduate', unit: '' },
    { id: 13, name: 'medicine', label: 'Medicine', tags: 'degree-eligible graduate', unit: '' },
    { id: 14, name: 'graduate-business', label: 'Graduate Program - Bussines (not MBA)', tags: 'degree-eligible graduate', unit: '' },
    { id: 15, name: 'graduate-engineering', label: 'Graduate Program - Engineering', tags: 'degree-eligible graduate', unit: '' },
    { id: 16, name: 'graduate-dentistry', label: 'Graduate - Dentistry', tags: 'degree-eligible graduate', unit: '' },
    { id: 17, name: 'graduate-nursing', label: 'Graduate - Nursing', tags: 'degree-eligible graduate', unit: '' },
    { id: 18, name: 'graduate-pharmacy', label: 'Graduate - Pharmacy', tags: 'degree-eligible graduate', unit: '' },
    { id: 19, name: 'graduate-other', label: 'Graduate - Other', tags: 'degree-eligible graduate', unit: '' },
    
    { id: 20, name: 'accelerated-medical', label: 'Accelerated Medical', tags: 'degree-eligible undergraduate', unit: '' },
    { id: 21, name: 'allopathic-medicine', label: 'Allopathic Medicine', tags: 'degree-eligible undergraduate', unit: '' },
    { id: 22, name: 'architecture', label: 'Architecture', tags: 'degree-eligible undergraduate', unit: '' }
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