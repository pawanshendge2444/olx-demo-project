## Transfers

```rb
require "razorpay"
Razorpay.setup('key_id', 'key_secret')
```

### Create transfers from payment

```rb

paymentId = "pay_E8JR8E0XyjUSZd"

para_attr = {
   "transfers": [
    {
      "account": 'acc_HgzcrXeSLfNP9U',
      "amount": 100,
      "currency": "INR",
      "notes": {
        "name": "Gaurav Kumar",
        "roll_no": "IEC2011025"
      },
      "linked_account_notes": [
        "branch"
      ],
      "on_hold": 1,
      "on_hold_until": 1671222870
    }
  ]
 }

Razorpay::Payment.fetch(paymentId).transfer(para_attr)
```

**Parameters:**

| Name          | Type        | Description                                 |
|---------------|-------------|---------------------------------------------|
| paymentId*   | string      | The id of the payment to be fetched  |
| transfers   | object     | All parameters listed [here](https://razorpay.com/docs/api/route/#create-transfers-from-payments) are supported |

**Response:**
```json
{
  "entity": "collection",
  "count": 1,
  "items": [
    {
      "id": "trf_E9uhYLFLLZ2pks",
      "entity": "transfer",
      "source": "pay_E8JR8E0XyjUSZd",
      "recipient": "acc_CPRsN1LkFccllA",
      "amount": 100,
      "currency": "INR",
      "amount_reversed": 0,
      "notes": {
        "name": "Gaurav Kumar",
        "roll_no": "IEC2011025"
      },
      "on_hold": true,
      "on_hold_until": 1671222870,
      "recipient_settlement_id": null,
      "created_at": 1580218356,
      "linked_account_notes": [
        "roll_no"
      ],
      "processed_at": 1580218357
    }
  ]
}
```
-------------------------------------------------------------------------------------------------------

### Create transfers from order

```rb
para_attr = {
  "amount": 2000,
  "currency": "INR",
  "transfers": [
    {
      "account": "acc_CPRsN1LkFccllA",
      "amount": 1000,
      "currency": "INR",
      "notes": {
        "branch": "Acme Corp Bangalore North",
        "name": "Gaurav Kumar"
      },
      "linked_account_notes": [
        "branch"
      ],
      "on_hold": 1,
      "on_hold_until": 1671222870
    },
    {
      "account": "acc_CNo3jSI8OkFJJJ",
      "amount": 1000,
      "currency": "INR",
      "notes": {
        "branch": "Acme Corp Bangalore South",
        "name": "Saurav Kumar"
      },
      "linked_account_notes": [
        "branch"
      ],
      "on_hold": 0
    }
  ]
}

Razorpay::Order.create(para_attr)
```

**Parameters:**

| Name          | Type        | Description                                 |
|---------------|-------------|---------------------------------------------|
| amount*   | integer      | The transaction amount, in paise |
| currency*   | string  | The currency of the payment (defaults to INR)  |
|  receipt      | string      | A unique identifier provided by you for your internal reference. |
| transfers["account"]*   | string     | The id of the account to be fetched   |
| transfers["amount"]*   | integer     | The transaction amount, in paise |
| transfers["currency"]*   | string     | The currency of the payment (defaults to INR)  |
| transfers["notes"]   | object     | Key-value pair that can be used to store additional  |
| transfers["linked_account_notes"]   | array     | A key-value pair  |
| transfers["on_hold"]*   | boolean     | Possible values is `0` or `1`  |
| transfers["on_hold_until"]   | integer     | Timestamp, in Unix, that indicates until when the settlement of the transfer must be put on hold |

**Response:**
```json
{
  "id": "order_E9uTczH8uWPCyQ",
  "entity": "order",
  "amount": 2000,
  "amount_paid": 0,
  "amount_due": 2000,
  "currency": "INR",
  "receipt": null,
  "offer_id": null,
  "status": "created",
  "attempts": 0,
  "notes": [],
  "created_at": 1580217565,
  "transfers": [
    {
      "recipient": "acc_CPRsN1LkFccllA",
      "amount": 1000,
      "currency": "INR",
      "notes": {
        "branch": "Acme Corp Bangalore North",
        "name": "Gaurav Kumar"
      },
      "linked_account_notes": [
        "branch"
      ],
      "on_hold": true,
      "on_hold_until": 1671222870
    },
    {
      "recipient": "acc_CNo3jSI8OkFJJJ",
      "amount": 1000,
      "currency": "INR",
      "notes": {
        "branch": "Acme Corp Bangalore South",
        "name": "Saurav Kumar"
      },
      "linked_account_notes": [
        "branch"
      ],
      "on_hold": false,
      "on_hold_until": null
    }
  ]
}
```
-------------------------------------------------------------------------------------------------------

### Direct transfers

```rb
para_attr = {
  "account": accountId,
  "amount": 500,
  "currency": "INR"
}

Razorpay::Transfer.create(para_attr)
```

**Parameters:**

| Name          | Type        | Description                                 |
|---------------|-------------|---------------------------------------------|
| accountId*   | string      | The id of the account to be fetched  |
| amount*   | integer      | The amount to be captured (should be equal to the authorized amount, in paise) |
| currency*   | string  | The currency of the payment (defaults to INR)  |

**Response:**
```json
{
  "id": "trf_E9utgtfGTcpcmm",
  "entity": "transfer",
  "source": "acc_CJoeHMNpi0nC7k",
  "recipient": "acc_CPRsN1LkFccllA",
  "amount": 100,
  "currency": "INR",
  "amount_reversed": 0,
  "notes": [],
  "fees": 1,
  "tax": 0,
  "on_hold": false,
  "on_hold_until": null,
  "recipient_settlement_id": null,
  "created_at": 1580219046,
  "linked_account_notes": [],
  "processed_at": 1580219046
}
```
-------------------------------------------------------------------------------------------------------

### Fetch transfer for a payment

```rb
paymentId = "pay_E8JR8E0XyjUSZd"

Razorpay::Payment.fetch_transfer(paymentId)
```

**Parameters:**

| Name          | Type        | Description                                |
|---------------|-------------|---------------------------------------------|
| paymentId*   | string      | The id of the payment to be fetched  |

**Response:**
```json
{
  "entity": "collection",
  "count": 1,
  "items": [
    {
      "id": "trf_EAznuJ9cDLnF7Y",
      "entity": "transfer",
      "source": "pay_E9up5WhIfMYnKW",
      "recipient": "acc_CMaomTz4o0FOFz",
      "amount": 1000,
      "currency": "INR",
      "amount_reversed": 100,
      "notes": [],
      "fees": 3,
      "tax": 0,
      "on_hold": false,
      "on_hold_until": null,
      "recipient_settlement_id": null,
      "created_at": 1580454666,
      "linked_account_notes": [],
      "processed_at": 1580454666
    }
  ]
}
```
-------------------------------------------------------------------------------------------------------

### Fetch transfer for an order

```rb
orderId = "order_DSkl2lBNvueOly"

Razorpay::Order.fetch_transfer_order(orderId)
```

**Parameters:**

| Name          | Type        | Description                                 |
|---------------|-------------|---------------------------------------------|
| orderId*   | string      | The id of the order to be fetched  |

**Response:**
```json
{
  "id": "order_DSkl2lBNvueOly",
  "entity": "order",
  "amount": 1000,
  "amount_paid": 1000,
  "amount_due": 0,
  "currency": "INR",
  "receipt": null,
  "offer_id": null,
  "status": "paid",
  "attempts": 1,
  "notes": [],
  "created_at": 1570794714,
  "transfers": {
    "entity": "collection",
    "count": 1,
    "items": [
      {
        "id": "trf_DSkl2lXWbiADZG",
        "entity": "transfer",
        "source": "order_DSkl2lBNvueOly",
        "recipient": "acc_CNo3jSI8OkFJJJ",
        "amount": 500,
        "currency": "INR",
        "amount_reversed": 0,
        "notes": {
          "branch": "Acme Corp Bangalore North",
          "name": "Gaurav Kumar"
        },
        "fees": 2,
        "tax": 0,
        "on_hold": true,
        "on_hold_until": 1670776632,
        "recipient_settlement_id": null,
        "created_at": 1570794714,
        "linked_account_notes": [
          "Acme Corp Bangalore North"
        ],
        "processed_at": 1570794772
      }
    ]
  }
}

```
-------------------------------------------------------------------------------------------------------

### Fetch transfer

```rb
transferId = "trf_E7V62rAxJ3zYMo"

Razorpay::Transfer.fetch(transferId)
```

**Parameters:**

| Name          | Type        | Description                                 |
|---------------|-------------|---------------------------------------------|
| transferId*   | string      | The id of the transfer to be fetched  |

**Response:**
```json
{
  "id": "trf_E7V62rAxJ3zYMo",
  "entity": "transfer",
  "source": "pay_E6j30Iu1R7XbIG",
  "recipient": "acc_CMaomTz4o0FOFz",
  "amount": 100,
  "currency": "INR",
  "amount_reversed": 0,
  "notes": [],
  "fees": 1,
  "tax": 0,
  "on_hold": false,
  "on_hold_until": null,
  "recipient_settlement_id": null,
  "created_at": 1579691505,
  "linked_account_notes": [],
  "processed_at": 1579691505
}
```
-------------------------------------------------------------------------------------------------------

### Fetch transfers for a settlement

```rb
recipientSettlementId = "setl_DHYJ3dRPqQkAgV"

Razorpay::Transfer.all({
   "recipient_settlement_id": recipientSettlementId
})
```

**Parameters:**

| Name          | Type        | Description                                 |
|---------------|-------------|---------------------------------------------|
| recipientSettlementId*   | string    | The recipient settlement id obtained from the settlement.processed webhook payload.  |

**Response:**
```json
{
  "entity": "collection",
  "count": 1,
  "items": [
    {
      "id": "trf_DGSTeXzBkEVh48",
      "entity": "transfer",
      "source": "pay_DGSRhvMbOqeCe7",
      "recipient": "acc_CMaomTz4o0FOFz",
      "amount": 500,
      "currency": "INR",
      "amount_reversed": 0,
      "notes": [],
      "fees": 2,
      "tax": 0,
      "on_hold": false,
      "on_hold_until": null,
      "recipient_settlement_id": "setl_DHYJ3dRPqQkAgV",
      "created_at": 1568110256,
      "linked_account_notes": [],
      "processed_at": null
    }
  ]
}
```
-------------------------------------------------------------------------------------------------------

### Fetch settlement details

```rb
Razorpay::Transfer.fetch_settlements
```

**Response:**
```json
{
  "entity": "collection",
  "count": 1,
  "items": [
    {
      "id": "trf_DGSTeXzBkEVh48",
      "entity": "transfer",
      "source": "pay_DGSRhvMbOqeCe7",
      "recipient": "acc_CMaomTz4o0FOFz",
      "amount": 500,
      "currency": "INR",
      "amount_reversed": 0,
      "notes": [],
      "fees": 2,
      "tax": 0,
      "on_hold": false,
      "on_hold_until": null,
      "recipient_settlement_id": "setl_DHYJ3dRPqQkAgV",
      "recipient_settlement": {
        "id": "setl_DHYJ3dRPqQkAgV",
        "entity": "settlement",
        "amount": 500,
        "status": "failed",
        "fees": 0,
        "tax": 0,
        "utr": "CN0038699836",
        "created_at": 1568349124
      },
      "created_at": 1568110256,
      "linked_account_notes": [],
      "processed_at": null
    }
  ]
}
```
-------------------------------------------------------------------------------------------------------

### Refund payments and reverse transfer from a linked account

```rb
paymentId = "pay_EAdwQDe4JrhOFX"

para_attr = {
    "amount" : 100,
    "reverse_all" : 1
}

Razorpay::Payment.fetch(paymentId).refund(para_attr)
```

**Parameters:**

| Name          | Type        | Description                                 |
|---------------|-------------|---------------------------------------------|
| paymentId*   | string      | The id of the payment to be fetched  |
| amount*   | integer      | The amount to be captured (should be equal to the authorized amount, in paise) |
| reverse_all   | boolean    | Reverses transfer made to a linked account. Possible values:<br> * `1` - Reverses transfer made to a linked account.<br>* `0` - Does not reverse transfer made to a linked account.|

**Response:**
```json
{
  "id": "rfnd_EAzovSwG8jBnGf",
  "entity": "refund",
  "amount": 100,
  "currency": "INR",
  "payment_id": "pay_EAdwQDe4JrhOFX",
  "notes": [],
  "receipt": null,
  "acquirer_data": {
    "rrn": null
  },
  "created_at": 1580454723
}
```
-------------------------------------------------------------------------------------------------------

### Fetch payments of a linked account

```rb
Razorpay.headers = {"X-Razorpay-Account" => "linkedAccountId"}

Razorpay::Payment.all
```

**Parameters:**

| Name          | Type        | Description                                 |
|---------------|-------------|---------------------------------------------|
| X-Razorpay-Account   | string      | The linked account id to fetch the payments received by linked account |

**Response:**
```json
{
  "entity": "collection",
  "count": 2,
  "items": [
    {
      "id": "pay_E9uth3WhYbh9QV",
      "entity": "payment",
      "amount": 100,
      "currency": "INR",
      "status": "captured",
      "order_id": null,
      "invoice_id": null,
      "international": null,
      "method": "transfer",
      "amount_refunded": 0,
      "refund_status": null,
      "captured": true,
      "description": null,
      "card_id": null,
      "bank": null,
      "wallet": null,
      "vpa": null,
      "email": "",
      "contact": null,
      "notes": [],
      "fee": 0,
      "tax": 0,
      "error_code": null,
      "error_description": null,
      "created_at": 1580219046
    }
  ]
}
```
-------------------------------------------------------------------------------------------------------

### Reverse transfers from all linked accounts

```rb
transferId = "trf_EAznuJ9cDLnF7Y"

para_attr = {
    "amount":100
}

Razorpay::Transfer.fetch(transferId).reverse(para_attr)
```

**Parameters:**

| Name          | Type        | Description                                 |
|---------------|-------------|---------------------------------------------|
| transferId*   | string      | The id of the transfer to be fetched  |
| amount   | integer      | The amount to be captured (should be equal to the authorized amount, in paise) |

**Response:**
```json
{
  "id": "rvrsl_EB0BWgGDAu7tOz",
  "entity": "reversal",
  "transfer_id": "trf_EAznuJ9cDLnF7Y",
  "amount": 100,
  "fee": 0,
  "tax": 0,
  "currency": "INR",
  "notes": [],
  "initiator_id": "CJoeHMNpi0nC7k",
  "customer_refund_id": null,
  "created_at": 1580456007
}
```
-------------------------------------------------------------------------------------------------------

### Hold settlements for transfers
```rb

paymentId = "pay_EB1R2s8D4vOAKG" 

para_attr = {
  "transfers": [
    {
      "amount": 100,
      "account": "acc_I0QRP7PpvaHhpB",
      "currency": "INR",
      "on_hold": 1
    }
  ]
}

Razorpay::Payment.fetch(paymentId).transfer(para_attr)
```

**Parameters:**

| Name          | Type        | Description                                 |
|---------------|-------------|---------------------------------------------|
| paymentId*   | string      | The id of the transfer to be fetched  |
| transfers   | array     | All parameters listed here https://razorpay.com/docs/api/route/#hold-settlements-for-transfers are supported |

**Response:**
```json
{
  "entity": "collection",
  "count": 1,
  "items": [
    {
      "id": "trf_EB1VJ4Ux4GMmxQ",
      "entity": "transfer",
      "source": "pay_EB1R2s8D4vOAKG",
      "recipient": "acc_CMaomTz4o0FOFz",
      "amount": 100,
      "currency": "INR",
      "amount_reversed": 0,
      "notes": [],
      "fees": 1,
      "tax": 0,
      "on_hold": true,
      "on_hold_until": null,
      "recipient_settlement_id": null,
      "created_at": 1580460652,
      "linked_account_notes": [],
      "processed_at": 1580460652
    }
  ]
}
```
-------------------------------------------------------------------------------------------------------

### Modify settlement hold for transfers
```rb
paymentId = "pay_EAeSM2Xul8xYRo"

para_attr = {
  "on_hold": "1",
  "on_hold_until": "1679691505"
}
Razorpay::Transfer.fetch(transferId).edit(para_attr)
```

**Parameters:**

| Name          | Type        | Description                                 |
|---------------|-------------|---------------------------------------------|
| transferId*   | string      | The id of the transfer to be fetched  |
| on_hold*   | boolean      | Possible values is `0` or `1`  |
| on_hold_until   | integer      | Timestamp, in Unix, that indicates until when the settlement of the transfer must be put on hold |

**Response:**
```json
{
  "id": "trf_EB17rqOUbzSCEE",
  "entity": "transfer",
  "source": "pay_EAeSM2Xul8xYRo",
  "recipient": "acc_CMaomTz4o0FOFz",
  "amount": 100,
  "currency": "INR",
  "amount_reversed": 0,
  "notes": [],
  "fees": 1,
  "tax": 0,
  "on_hold": true,
  "on_hold_until": 1679691505,
  "recipient_settlement_id": null,
  "created_at": 1580459321,
  "linked_account_notes": [],
  "processed_at": 1580459321
}
```

-------------------------------------------------------------------------------------------------------

**PN: * indicates mandatory fields**
<br>
<br>
**For reference click [here](https://razorpay.com/docs/api/route/#transfers/)**