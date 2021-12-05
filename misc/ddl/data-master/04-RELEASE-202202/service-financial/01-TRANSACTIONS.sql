INSERT INTO SERVICE_FINANCIAL.transaction (`id`, `created_at`, `created_by_user_id`, `updated_at`,
                                           `updated_by_user_id`, `application_type`,
                                           `internal_transaction_ref`, `payment_mode`,
                                           `transaction_amount`, `transaction_status`,
                                           `nets_transaction_id`, `paynow_transaction_id`)
VALUES (1, '2021-11-05 02:02:09', 155, '2021-11-05 02:02:27', 155, 'EXAM', 'CC20211105100208630',
        'NETS_CC', 112.35, 'SUCCESS', 1, NULL);

INSERT INTO SERVICE_FINANCIAL.transaction (id, created_at, created_by_user_id, updated_at,
                                           updated_by_user_id, application_type,
                                           internal_transaction_ref, payment_mode,
                                           transaction_amount, transaction_status,
                                           nets_transaction_id, paynow_transaction_id)
VALUES (2, CURRENT_TIMESTAMP, 123, CURRENT_TIMESTAMP, 123, 'APPEAL', 'CC20210921110136004', 'NETS_CC',
        114, 'SUCCESS', 2, NULL);

INSERT INTO SERVICE_FINANCIAL.transaction (id, created_at, created_by_user_id, updated_at,
                                           updated_by_user_id, application_type,
                                           internal_transaction_ref, payment_mode,
                                           transaction_amount, transaction_status,
                                           nets_transaction_id, paynow_transaction_id)
VALUES (3, CURRENT_TIMESTAMP, 175, CURRENT_TIMESTAMP, 175, 'APPEAL', 'CC20210921110555555', 'NETS_CC',
        114, 'SUCCESS', 3, NULL);

INSERT INTO SERVICE_FINANCIAL.transaction (id, created_at, created_by_user_id, updated_at,
                                           updated_by_user_id, application_type,
                                           internal_transaction_ref, payment_mode,
                                           transaction_amount, transaction_status,
                                           nets_transaction_id, paynow_transaction_id)
VALUES (4, CURRENT_TIMESTAMP, 153, CURRENT_TIMESTAMP, 153, 'APPEAL', 'CC20210921110888888', 'NETS_CC',
        114, 'SUCCESS', 4, NULL);