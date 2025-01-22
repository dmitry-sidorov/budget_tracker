## Budget Tracker App

### Main requirements

- Track daily incomes and bills.
- Plan budget for desired period (week, 1/2 month, month).
- Compare planned and actual budget plans.
- Show statistics of bills by categories.
- Show current accounts' amount in different currencies.
- Allow users to make groups for mutual budget.

### Applications

1. API: Elixir, Phoenix
2. Web frontend: Phoenix, LiveView
3. Database: Postgres
4. Mobile: Adaptive LiveView (ReactNative?, Flutter?)
5. Bot: Telegram

### API Requirements

#### Authentication

- User registration and login endpoints
- JWT token-based authentication
- Password reset functionality

#### User Management

- CRUD operations for user profiles
- User preferences and settings
- User groups management for shared budgets

#### Accounts

- Create/update/delete financial accounts
- Support multiple currencies
- Track account balances
- Transfer between accounts

#### Transactions

- Record income and expenses
- Bulk transaction import
- Recurring transactions
- Transaction categories management
- Transaction tags
- Attach receipts/documents to transactions

#### Budget Planning

- Create budget plans for different periods
- Set spending limits by category
- Track actual vs planned spending
- Budget templates
- Budget sharing within groups

#### Reports & Analytics

- Spending trends by category
- Income vs expense analysis
- Monthly/yearly reports
- Custom date range reports
- Export data in various formats (CSV, PDF)

#### Notifications

- Budget limit alerts
- Bill payment reminders
- Unusual spending patterns
- Group activity notifications

#### Currency

- Real-time currency conversion
- Support for multiple currencies
- Historical exchange rates
