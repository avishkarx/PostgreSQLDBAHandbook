
#### **2. `/scripts`**

- **`/ddl/create_tables.sql`**:
```sql
-- Create Organizations table
CREATE TABLE organizations (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Departments table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    organization_id INT REFERENCES organizations(organization_id),
    name VARCHAR(100) NOT NULL
);

-- Create Revenue Budget table
CREATE TABLE revenue_budget (
    budget_id SERIAL PRIMARY KEY,
    department_id INT REFERENCES departments(department_id),
    budget_year INT NOT NULL,
    projected_revenue DECIMAL(15, 2),
    status VARCHAR(20) CHECK (status IN ('Draft', 'Approved', 'Executed'))
);