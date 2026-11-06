Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.193.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793968333;
	b=qUpfaICllLpnjcfO7VG7wN70Ho6Kbfo8MPavPpuvZXcbm2OCXlNBP+WtwAJ3/R8l1apy
	 QK7AqPmZaBM51a+VIiUGPbzdXBiQXIKAF7bLALwLXDGhBEnloXUCAqYtsxc2rK0eYn8kN
	 DteSeOw0iR5RKsS0rUZRr8zVSpteB2A/maAh5O6ALrdwiDnolcf+b400Aby5MY6VqJJb5
	 EQUTUiL7zz8Xv6lbuuRl614NB/iBvYXgPtFY7sndAR+z6e3AMT0cDhhAgkbqIB30gJ2Ha
	 nZ0ZUQL34Z6ZraXILtv8QWMo6EV3Rb4GTK6fP81CA4A6yGTo5eF5cqLnPdOk50omkfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968333;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Content-Type:Date:
	 Message-Id:Cc:Subject:From:To:Content-Transfer-Encoding:References:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=YZ4zklYllwQxm3dc/W7t4KcrYPHWCu32ZffgsouXqjM=;
	b=AOUYUO3lyLHfo2vPRtZwPoBXe+l9Q6QAmTO53e2zk/0rUo2RtpBlmDenVs6H160xE44G
	 /61xV9xABpKjJVhEH55Ausr+U/NOHwBdO2SmRha+MxyLF4JCWsL/8Fiz9QX34cI5S/qe1
	 c9py6KeqFA8Sy7fQSo+ffq+pRMHqzfARF/wgLmYJHuDzyzsSgyndmEIVIitM+Bgw6zprE
	 99EnC4WWd5cxdsh/qItzE4t3qGMKw4FEOcnzISWxbyVUi5v71UttWrMQ0DUeNbu1yF3J0
	 zqk8E9QbmECt3Rutw4FR/a9CIY5KkoWgnHggu6xAqKf6vvqJCvFHPEKC3BR+tp9Mo+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=byBtYzgi;
	arc=fail smtp.remote-ip=52.101.193.60
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010060.outbound.protection.outlook.com [52.101.193.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29767606A32D
	for <nova-gpu@lists.linux.dev>; Fri,  6 Nov 2026 12:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29767606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=byBtYzgi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f19UccN4xG1BmNGxjOa/z+0gblbtKpiP3wgQtTlNqoOwVF/uS+eVQW6wlARfvxOYx/WDEY4kn0FmtYYTfrK5y98/0pPK+Gv55RzgezQfOeGFW28piT4FyvrlDij5fsceP+dllGNgiXEO+hv1yQTj09msDvF2h89E92IDxaLgH1zMNTEO8gMGyfNe0W87RIhCVZLIMTUFZSLgUzsXJwBGw1HQenRkLw3d27V33vUxlxKcgPWiB+iVr8i70I9Jb1NhzpnlOEQp4m6z0/+PfwaJMTAEXobIzmuN4RrP583MJHbUhs23dbmOIXBWBVwSCJjfC+RUYINo6adubpKNNk50CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZ4zklYllwQxm3dc/W7t4KcrYPHWCu32ZffgsouXqjM=;
 b=Rkv97m3Mf+wZrbWEzHxEiqcZ1Ug30tfn5tVzLwGST0yA4wQVht/0/ImPa007rqq61HSaq4BCjDErbFDfHRZ3sDGCTYd02fU67SZrVHqYQVX3HLkn1aMeGCfCx7zJ9KYOVPKKswDkIpRgUycKIq+Cp8nQXuhWC+3WN0VB/+lR7Vnjqs5JOJEhR5CeyQt1dGD3htfEX1MSKyHrWIhzgTKQTxztM82DL07BbCkG8PLyCrSqjHaxEvqvE8mPK6DDd3lU9PCXd5strybwKEJJ7rdwvbscq1DZAWapzbS9RhpC69Zrf0Wk5CLOs+GjMi7TB2BtYVWx2XOizcg+0gEObfa/3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZ4zklYllwQxm3dc/W7t4KcrYPHWCu32ZffgsouXqjM=;
 b=byBtYzgiWZwzY8HqROq3zS0FzjqMx/LSuN+T6V2ZTjcwwtwgPWk9eGjfuzndsYQ1Q7qDUsih+14OZxi20NlvMjMeLCw9MW49ch53yWTZZNfxqt1RUUKcRkPIfdsXzVObtLXJp19D32nbOgFnYzlD0OSnjNxagrQDimEhGivqzjnBhzWEDca+xWAlwiJ2sGnmX3U5wNSoegeXK3gJ1eUrbA8q7JJ28m2L9KcB4GIrxLKAQfYj75/5Pjdd8hqKos+Q9TU8gFKZM6CmT+yYeRaYD6RvGZtKQg9XFFGkjF5R8HvoJsJjFN9qkGlO7z0h5F3Xy6utCTb0lEyL7DIpeQUeNQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CH9PR12MB234974.namprd12.prod.outlook.com (2603:10b6:610:315::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 12:32:05 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 12:32:04 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 21:32:01 +0900
Message-Id: <DMO4P1N5MQUH.22LIPLBORK125@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/7] gpu: nova-core: run the generic bootloader from its
 own type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
 <20261103-r000-fw-v1-4-e3d38fc130e3@nvidia.com>
 <DMNAGSL6AZXR.2LDSAZU9GOTEF@nvidia.com>
In-Reply-To: <DMNAGSL6AZXR.2LDSAZU9GOTEF@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0087.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::15) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CH9PR12MB234974:EE_
X-MS-Office365-Filtering-Correlation-Id: 32ebad56-9a02-4456-99f1-08df3c01f6d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|23010399003|1800799024|366016|10067099003|261026140227099003|56012099006|4143699003|261026121527099003|261021123027099003|261009223027099003|261022105027099003|261021121427099003|261022075727099003|11063799006|261028144727099003|261102123227099003|10063799003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	xIccuxxEIpU5wWTx/yAgVAmfLzpw3AeYlGpyD7FV5qRhGHHv3XMRBUex0yA7xiKUXD5ArtI1Yi/pvjNCUtUqtQA7S9A7L7zlEu2veJVrgmlcB4tdygiw1hN3+2EXhtn298BI+eWBq8aar6GOjKzARBguEMmVTig5YYbcxLVg9qwG7uivf22ts02IMQzkt1XJ8mjemoMB8H//R4zsvLBZe5E8ioxLfMrJJ9hbgAXeGlpmmDQ4V0u0BwcU4tQbomA8MV6oFrMnpMrJWT4sL8sW22IItU3mDOPsWJX0nQnf+llHEHtLEbkHmPKeAZet4DjQpC9TNnghhfe/zgjJ82syJsZX1PLNg/2U8YX19aJFmPiBWbQl1U4PjzBE1/C3PcxRDzxFw5sK8G83zVnRPYXsX5EKdLjXosZBV1HXSFr5RWG0hWFCB+nTkNxCL4ui5oMjoSUVO2yAwcbg/IPUUjlq9gaDF21FNjPwoWufiNVpICWiPO+lnoRxwvQ8zydm0lWmkK7YP1CIZu1FWqdsriO5n04CwilIQyvZz4bhz/++NBeXJhKhdvvpsStACNQaT0/Qc+Yt9mqak9mugZ9WmPYZw7rXiHH+Oh0qiXdzc+2tCMo7sVZa1EexdX6Z3aSjuWtvnm3Ym5nh+cwJCmJSWSPl72+L2ot6lTYRIqo6vcGAjVM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(1800799024)(366016)(10067099003)(261026140227099003)(56012099006)(4143699003)(261026121527099003)(261021123027099003)(261009223027099003)(261022105027099003)(261021121427099003)(261022075727099003)(11063799006)(261028144727099003)(261102123227099003)(10063799003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE9JRko3WENLQVU2S3FEdWdJSmt6T1NMT1d2bmVIVUlLWmk0MWhlSUdxRFJi?=
 =?utf-8?B?L1FRNjBSNWE0UWZFM3JlL0lRYStZOStEWmRWVnd3YTVYQ0FXU2l6QnRwSGRo?=
 =?utf-8?B?ZDF6c3dkYnFPckxaUlUweS90K3FXaGJMN3FlSHRIV2pkQ016ZXJYK0ZDdHd5?=
 =?utf-8?B?czkrS3ljTS9aSlBOeXY4Y3JwS1pTOVAyd0FaVEpKYkN0SmUzQ1ZkNzlrK2gw?=
 =?utf-8?B?VlM1NFZkZ0FNZlNpa3luLzBzMnRrRm9JQTBqbDBySVNsdEN2eGtiOFhoOHpl?=
 =?utf-8?B?d0tuSXhxT2w4NlA5YVVBR2Jwb0xrb2ZBUkdNVFZVSUhCeG1zaHZsM2NxTjBM?=
 =?utf-8?B?UEJpRDA2VWhrK3Y0ckR6elUycnh2TXJQZS8xd0tNTU1Hc3kxeDJVRkplZlJ2?=
 =?utf-8?B?TFBjYnphMTRKeTZpcTBMKzNVdEFOVGlkZFZVd3ovbElKVExWcEFhZHhweSt2?=
 =?utf-8?B?ek95cFVQejhvamF5OTZJL1JZZ2FDY0hFaHZYTnFvdjFkWnkvUzdkMW44VnFT?=
 =?utf-8?B?WGlPa0ROaFRDcldtV0J1WUJHVllraGdIMTJBRkEzcXpwTEl4aG9VVU8rV2lr?=
 =?utf-8?B?eUpUNlhXdjRDUjVjMUNpSWN2MHZwOEIvY2N2SFlSTU51VnZVUWdXVDJKMHdL?=
 =?utf-8?B?YmNYdUhTSG13QTJHTXkxZWRhc210VHUrUFUyQ3djazFka2t1WU8rNmdadXZj?=
 =?utf-8?B?dGxSL01FSXY4cVYxNlU1TCt2Smg2aVdPdHJaWW5DVElEbnVoM08rc0RoeHFs?=
 =?utf-8?B?ZTRqdHgwYmJSOWVzNDdVUGZBN1MrMTE0bTBvOGRQL2U5ZWtRWnEvNjRGc2I0?=
 =?utf-8?B?SENkNXF1SlZ1Sm51NDZteGovU2RWOFViL3JqNjhCdjdlbHhYSkJmSEFXaU1Y?=
 =?utf-8?B?VkJvR2ZVdlRlL3hQa25LOGhKNklBanBIV0grVkJ2SXEyVWpGN3NpMzA2dk82?=
 =?utf-8?B?SytTYjlabmFZZU9saEczWEI2Rm5NeVFQUXRtSXRQSVFacW5ROTNUcG8wRldu?=
 =?utf-8?B?anN6czduM0Fvd2Nzc2pyOTdXdzVSNTVzbUJ4WUtid1lBRzhIK0o1NnJHdWJL?=
 =?utf-8?B?eXFoOTFoeFErYWNUUGVBVmxQVGNmWWU3Qzd2M2pUYkFZdjBrR3o3amhSZHZR?=
 =?utf-8?B?b3lHTERXUE9lR1hoRzNhRHZQeGlzekFBWkZRTnI2c2FFK1B6YTRrSkt3SFRh?=
 =?utf-8?B?dldPRTZpaEJmdGNEUDE0bjc0aEpIZTNpU2hkR1Bick9DZDQ0Y0cyL0o1ODBp?=
 =?utf-8?B?cERnWEE0dFFNNkpIYndQTmthVHpNUU1wTXVEb0R4YWExcWRZM1p0Y2JaNm5K?=
 =?utf-8?B?SVlwdmVORjQ2LzVCNmNpZTRBRktYNFAwa3FiaVZ0SmszYmpuREFBS3FIRjdk?=
 =?utf-8?B?Y2lNRXFnNVJVV2ZOZVNzZ1EwOTI5OGNXdGVEc2MzVmJWNjYrRStUb0pQejVQ?=
 =?utf-8?B?NzE5TEsrdG1BL0FycnE0SmVPRkNFZ2JHOUtBRWxKRGNjdmRIL0o5N0E4d0JS?=
 =?utf-8?B?WGtHSHg5Y0hnMFo3SFR0OGtuTk4vTGZtaVRoTXZlVGNPbkpnWEZyU0FZMkNo?=
 =?utf-8?B?VVFOcEsvNmtQRjc0R2E1eUtMWW9ldExySmxheXh4dnhiTGV3aW5meXM2c1hI?=
 =?utf-8?B?a243d1Q5RFdERllkWmsvaitzY3FCSVFNT1lOMnpMaWVTaERyODJkUlJPNEQ2?=
 =?utf-8?B?SzlkaU94RHU3V2VuTVZ0YTl3OVdBM3ZoZHlsaHM4dklxQy9hT0VqbTBoTHI5?=
 =?utf-8?B?MzRSazAzajh6UzBvVHo2TGtJQXZhQWFBUm9Sa3RjNnR5T29qZjk5RTYvNDhH?=
 =?utf-8?B?d1UyanhJL3duS3U4Y0VHbkVJRnF0anFpZU9VcnVZbTRuZEp5T3ZicG5yR0tu?=
 =?utf-8?B?WXZURlp6OUx4MlJMbE80UTRVNkV3Y0RLeS9wdWd0VWdYWWNvRkNvb3FJTlUv?=
 =?utf-8?B?OE1YRUZweXpESGp2S1ErakZyYWJpRmV3NWtONkVEdkNad2thMWtyRENLelBk?=
 =?utf-8?B?N1dWWWRUNlFrRkh4ZjJSeHd4Z29xZjVDQ0lNdXV5OFZULzJVekE3N1hqTldU?=
 =?utf-8?B?UnhPSzhHVUJqenNoRjgybUtkWTg4Z0pEbDNIUFdVZk53UzJjRjJGRFRwZVYw?=
 =?utf-8?B?UmhVYW9Benc4YmdvMDV6OXhEbUQxdEk5NGMwWFFiTXdCNFo4UExubzVpcUtV?=
 =?utf-8?B?NHQzYVBUS3RPd1lDK3Naa1IvRElRamQvUzFxS3g2N1FQZW5laitvV1M0d2Rz?=
 =?utf-8?B?dGFtSC9tWjlvUjRldXZDN2tyaS9WSUU1OUdxWkRGZWtiVjdaWk9VSDg0VlA3?=
 =?utf-8?B?ek83aDAyM1pKbGRCcHNQMk1LNlNSRjVIT21zc3hGeU5yNnNYdEZ3d2VvYk80?=
 =?utf-8?Q?oEG7C+dC1bdixqs93087gvR2fctjJSfFz50gMThV8nDtG?=
X-MS-Exchange-AntiSpam-MessageData-1: AUkJxavt2Q7cAw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ebad56-9a02-4456-99f1-08df3c01f6d5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 12:32:04.5869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42jOTd31f574+EEGa80/qnRAnWwCrqjblyV9aWBtG/nnj9Pqu42tOubD/e1l/bc0LyyXk3X+JTXkuTMoLI6gUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR12MB234974

On Thu Nov 5, 2026 at 9:50 PM JST, Eliot Courtney wrote:
> On Tue Nov 3, 2026 at 7:22 PM JST, Alexandre Courbot wrote:
>> From: John Hubbard <jhubbard@nvidia.com>
>>
>> The generic falcon bootloader needs a descriptor in DMEM to know what to
>> load, so loading it into a falcon means loading the two together by PIO
>> and starting the falcon. The FWSEC wrapper did that through its own
>> implementation of the PIO loading traits. The r000 load-and-execute
>> bootloader event will need to do the same thing.
>>
>> Give the generic bootloader a run method, which pairs it with the
>> descriptor that it receives, loads the pair by PIO, starts the falcon
>> with the given MAILBOX0 value and returns the mailboxes once the falcon
>> has halted. This will allow the FWSEC and r000 load-and-execute
>> bootloader event to share the same code.
>>
>> No functional changes.
>>
>> Assisted-by: LLM
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 55 ++-------------
>>  drivers/gpu/nova-core/firmware/gen_bootloader.rs   | 80 +++++++++++++++=
++++++-
>>  2 files changed, 84 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/driver=
s/gpu/nova-core/firmware/fwsec/bootloader.rs
>> index ad798ec5645a..c7bb877fcf20 100644
>> --- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
>> +++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
>> @@ -16,22 +16,16 @@
>>          register::Array,
>>          Io, //
>>      },
>> -    prelude::*,
>> -    transmute::AsBytes,
>> +    prelude::*, //
>>  };
>> =20
>>  use crate::{
>>      falcon::{
>>          gsp::Gsp,
>>          Falcon,
>> -        FalconBromParams,
>>          FalconDmaLoadable,
>>          FalconFbifMemType,
>> -        FalconFbifTarget,
>> -        FalconFirmware,
>> -        FalconPioDmemLoadTarget,
>> -        FalconPioImemLoadTarget,
>> -        FalconPioLoadable, //
>> +        FalconFbifTarget, //
>>      },
>>      firmware::{
>>          fwsec::FwsecFirmware,
>> @@ -50,11 +44,10 @@
>>  pub(crate) struct FwsecFirmwareWithBl<'a> {
>>      /// DMA object the bootloader will copy the firmware from.
>>      _firmware_dma: Coherent<'a, [u8]>,
>> +    /// The bootloader that copies the firmware.
>
> nit: doc change looks like it should be in a different patch
>
>>      bootloader: GenericBootloader,
>>      /// Descriptor to be loaded into DMEM for the bootloader to read.
>>      dmem_desc: BootloaderDmemDescV2,
>> -    /// BROM parameters of the loaded firmware.
>> -    brom_params: FalconBromParams,
>>  }
>> =20
>>  impl<'a> FwsecFirmwareWithBl<'a> {
>> @@ -127,7 +120,6 @@ pub(crate) fn new(
>>              _firmware_dma: firmware_dma,
>>              bootloader,
>>              dmem_desc,
>> -            brom_params: firmware.brom_params(),
>>          })
>>      }
>> =20
>> @@ -136,13 +128,9 @@ pub(crate) fn new(
>>      /// The bootloader will load the FWSEC firmware and then execute it=
. This function returns
>>      /// after FWSEC has reached completion.
>>      pub(crate) fn run(&self, dev: &Device<device::Bound>, falcon: &Falc=
on<'_, Gsp>) -> Result<()> {
>> -        // Reset falcon, load the firmware, and run it.
>>          falcon
>>              .reset()
>>              .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon:=
 {:?}\n", e))?;
>> -        falcon
>> -            .pio_load(self)
>> -            .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmwa=
re: {:?}\n", e))?;
>> =20
>>          // Configure DMA index for the bootloader to fetch the FWSEC fi=
rmware from system memory.
>>          falcon.pfalcon.update(
>
> Does it make sense for the generic bootloader to also do this step
> (falcon.pfalcon.update())? This appears to be something that's part of
> what the generic bootloader expects to be done no matter what, and it's
> doable just from `BootloaderDmemDescV2` which it already gets.

Yes, and that's a better design, notably because it removes the
documented precondition of `GenericBootloader::run` that the caller must
program the FBIF aperture, which I found a bit cumbersome.

However, the second user of the generic bootloader (the r000 load
handler) needs to specify a different `FalconFbifTarget`, so we need to
make this another parameter of `GenericBootloader::run`. Not a big deal
though.

What is a bit more of a big deal is that the r000 handler also uses a
new function taking a closure to program the aperture temporarily and
restore its original configuration afterwards, which is a better way
than what the current code is doing. So I'll bring that part from the
later patches into this series so it can use the final shape from the
get-go (with the beneficial side-effect that we will also merge more
r000 code earlier).

So thanks for this very insightful suggestion.

>
> Modulo answer to above question,
>
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

The patch has changed quite a bit so not taking this tag for now.
