Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793582150;
	b=BnnKhlSdPAyb05OLMLJCMGA7YuQXxGgeuU3IInAiNcw/YxLRYpcVBV8nbIj/xvz4BIF+
	 rg3QpoGDGOGhD39qZTfelYjSj6/MxAtBQtGLoeE7J6qo8WdlK3ZnFhhTYAPyRq1ymBJOM
	 somSRxD7i4iKdoo/MzJtq+0hByzZ8KjvllMA/ADc+2IVSlJAuikZB5hdLVruZmkUWZq9p
	 LIIM1777Bbc1HSKDmlNqHtL/9nKA1A9aAeg01O7Z0ZhxAfYjJWcUCNSKo8J+ge3zXUd2O
	 u46qyjCCl/Obr51UETQE3AP8X0jyGm7V23sUfIk3FQ8qDitNhFoOdut183x16zW4MLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793582150;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
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
	bh=GuuaVawZT2IEBdzTWeqTepujGPPV3Gn5sxycziGQ2m4=;
	b=ykLC0AMbqNj2oPFTlqC/77gTGhL4AGsTiIP5QV93TJhfxiKVAp8A4dz9IsFtNEW8GED5
	 C2fz2eD/VdovlLmP47GkBQORsGYOYwYVLB8cFALpZqKgPa3/AqPr0lWpsJoAPmTHGZB0y
	 fYhbyBvRdisYkmohFAkw0FRtGWGoKXwrK0pmzhHUr4z+Eu9zdUverSdc/vWCY7jbMPZyw
	 NfkFUri4r550/tDbmfhS6g/sE53GcnRstIj7RLYBoYJE8v4yhsdSej2J2LnmCoCkaJeVn
	 ULgazfBDsg8Ay6gICe5Cmtkk/hL3Tmeq+jXpmw2OfUOdNFhhkiadM6sjmcl/ZnIh7Iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SgETbqme;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.14
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010014.outbound.protection.outlook.com [40.93.198.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868FE606A324
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 01:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 868FE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SgETbqme
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpmXJtTUYX8rXhXElUrZjxTm3jgP/e3lPzXIEkBKQoztVhobxFL+0pPaV7m1kEZzcQ46eoUbTvtEUQqkyj7ESDpeOOEUMUvxnXYi0csb6nN2os2cjyF9P4G0aQ67iFV4g2k8b+5LysuF1UCtJPX4xb1qZjNIJIyd7vE9ZGZdkMw8wFnBZQ29LvNhDGY0DyhiOgugd27m3gxVmZi0n3VkQv/n7VhDuATxzYtWlr8d5zhoSHv25N0RnzklvU1Tpuc8PEfTuIuFzWJ1wr6efiOVd76+bxfU8tnDM3zyTORrtt4KmhKQf+M+BJnwcqliLRqAw7RxqTBegXvPB6/J5WUjcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuuaVawZT2IEBdzTWeqTepujGPPV3Gn5sxycziGQ2m4=;
 b=I9I7lOT8vegZ0cCuyQbmNw3FB9veBtVjhvbQQFdoenw6mGBU6WJ1ZrTI1KB4MzPK4U1KOOa8RUVWVMWh7B1T3v836faYbKsG6MDFO3LO3AvE0zvFMjoiArIrkyqouoPpezMnRqGuCQGXOa7fZJFPOJ/5BEXDWnqOeS4CdgUgLQhjQfyXQFjry1pAKT5V0yUZFH6j87wb22fIJ/0t3zNhagFVplQvWRr8Qyj//WyeAlA/la2pWUYmT0041vV1LjzKxaTJIwm56Y23vfZI60mUoR2qxDd2AmlJnRNWUXF0N3mjEWu60uL+Qia6LKU1CjoQdZFGbasBnRmmUQ84jw9F7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuuaVawZT2IEBdzTWeqTepujGPPV3Gn5sxycziGQ2m4=;
 b=SgETbqmeKkgjVwpo/iu1WT4RdO0yj7GRZIfAK75ooPOdaSqbRDPM+rxilMN2ixgYfdX2EMtRE5k/c746pcpzKaD8OAKspX6ojloIYH8k3C3aISRc5GbjfYeOn/DschyiaoLP1+vW9nZ9eI0SOaLAaU3mooiG0OYQHL2TOCOh/MHQMFtp2VRKnJB0AjDE0XgY4T2QPOCflGBbVQQRfPACQCPauF+2GxRwmvBUvfCd6sL7tF3bQIaMCVjpf+zvGXxfL8jSQ9X8h8JHh70zvsjJ/CvbCJ4i11yUWWnu3zXc1FqVniJ2o4jJLVA0vt625y/6rEn5n1NVWTRLb/L5yLjBYg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 SA1PR12MB999227.namprd12.prod.outlook.com (2603:10b6:806:4de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 01:14:15 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 01:14:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 10:14:12 +0900
Message-Id: <DMKBRW49XUV0.1QPBV1Z8AOTET@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/4] gpu: nova-core: fix stride of NV_PFSP_* registers
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261030-r000-cmdq-prep-v1-0-f2befbcd8ba9@nvidia.com>
 <20261030-r000-cmdq-prep-v1-1-f2befbcd8ba9@nvidia.com>
In-Reply-To: <20261030-r000-cmdq-prep-v1-1-f2befbcd8ba9@nvidia.com>
X-ClientProxiedBy: TY6P286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::19) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|SA1PR12MB999227:EE_
X-MS-Office365-Filtering-Correlation-Id: 8931f86c-600f-4c26-7784-08df387e9ca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|1800799024|23010399003|366016|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CNcE1e0vnS8KqTXLhSNaZwuuBSSTXHZsybaB+2dZZDHk0knBNvkDnDCD5WkqDqyui3gE/wIBmlwJ3WBp8VVqWEgzjCv83ckUg1ZwWMUr/O1a41+f8fCedy4+cSQ9dY6w3VPBagFSiJs2UX0ITdOURCzO5e5smTNRxZ3h01nRT5KaHEvD5QvAxgFepFO0aqbq3KKqQEMcDDJtWnk9yJVEs5KRKM6YaTP7nJ+Cr6UkZWhx+VWsMxUHZNy6RuI1j/RKDh/ASyzTnbjjrqdyU0MfhKWdAwOCmM28bZ+aCDCgtRh97YF1FHz13e/23T7wn0ikF/sXdvvUI6Z0qEzgmilev2FY5sGMsSrRD3YmJK/2ea2Tnqv/hIObTbnQXXbB4QKDOimghxZskKpT0p39dxZB+A9jkTPmCQPErIzQ1ZK0ttCHqs8ZS/BCJFaqrolJQKvrJGrsjOJ0lM2vbPff2oNow5nW0Dv00yyewEEq6mjFEy9BT2Bui+mn6q0GhgauIb9aUo8DjpmDriAnTKHBUlF6swa9X9h3sGhyr8Y9K6H83FpIicy9sFW/CghU0vn/AwOd9C8UoU49GDhwW6cDemHFdcBtYCqcTlvE8d2Vi83g8Du7mdim6Xyhg9kIANA3VwstVryMifi3G2Brfs0kphzesRxioQondteUW2oBheDOHo8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(23010399003)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzVWOFJSei9HR0ZQS3JlWEcxd2IvazVQa2U2K0cxaytUZ3ppRTNsNUg3QkUz?=
 =?utf-8?B?WHlHWjZnT3BaaFFaMjF6WkpKV1B4QnFsL0NXOXo4eUUvUmw5ZXp5RGZQZnBZ?=
 =?utf-8?B?Z1BOWGNMS0ZQWkhwTjYyaHNPSnVlM051NTVWT20vRHBoSWlsZmJsWnZORHAw?=
 =?utf-8?B?THZFMnhmaGhPZnFzWHFHMjZscUxNQmd4eEdkNXdqZGltYVFrL2FRUXNNVSs0?=
 =?utf-8?B?TFk2WVBQOElEVlNaMGl4SVU3WXJrRzF5MTNQc0hSWHhsVEhoNDE1a1BEdEhp?=
 =?utf-8?B?N3hzNlQzRnNVTXN1eTJxNWl5OE8vWFltaFZzM3pzRnBIdkVlTzE0SmF3eVRl?=
 =?utf-8?B?QVo4dXhIMmhOVlFhNFFNZURYQ3ZXekhoTDcwZmp3K0hUTDhnSDVKOVBxcVE4?=
 =?utf-8?B?dk1QMGFwL1graHNsSzE0aFViTHBpampzQmhNa3ptYWFuRFhQMmxnVHZDY2pN?=
 =?utf-8?B?T0tUemFLcUduUmpWWU5sV3hEYyt3Q2VwNGRlTXI5MXl4K0ZxZ09DVGxNaDR3?=
 =?utf-8?B?dEtJZ0F6Q3ZDWSt6Q2thbzcyZjB1cFkzOXJ3c1RxKzNzMmNHM1dJTTNSSDYx?=
 =?utf-8?B?MkRteTRCSk05Rm45U2t4dFNzWnM4YWdIZ2drdzFCVkt0dkdHejJGR1EzMTht?=
 =?utf-8?B?M2tpMmY4anA4ZlJjenpyTzM5TFU4S21TVDRmQzd4Y0tRNGQ2MVNJUkpHaE1r?=
 =?utf-8?B?cUJzY1FZRXU1RGxBM1AzZzk2VEswaFRFZ21iL0VVR3R2d0FVTVBJc2YyYjJU?=
 =?utf-8?B?SHgwUzNQVHp0VmJVUGhPdzlGdmlZS3BESFFzQll6blA1cklFV0JKM0NRQW1Q?=
 =?utf-8?B?L3M5Q1o0UTVROVh1T256VldWV1JvY1NPNGVpeVdhWDdnaXJzWTJyN3J5dlk1?=
 =?utf-8?B?VEVLYkU1Z3VUTmF1RS8rdzcwaFJCd0tkRzJ1VFVHWW8wNXd6S3VCdW94c3VI?=
 =?utf-8?B?TVhHaVZrdHJxTjJ5alQ5TUNjdTdydTAxd1Q1eU9TMXFoUm1scW5rRldveHRU?=
 =?utf-8?B?QXRXRjlvYzg4Uk5RejMxY1FWRlp0dnFRRGdRakI5TGFRdGZvRjhEdkhYazQz?=
 =?utf-8?B?NUtMUWVsbGpjUHk3NWNTSjY3Z0dsMEh4RFU3OXVYbzduNzNFOXZTaFVRZ0NT?=
 =?utf-8?B?OFNVSWFHVHlZY3lYS2ZTYWg2UEJ3UzRpS1h2VE1HeEN0cWk0WitUVkRyVjAx?=
 =?utf-8?B?dDd6amVERVpXNlYyeHQ0eEpQSXM3TlNiMnQrVFR5d0FKenZlalFLSDl5bWJp?=
 =?utf-8?B?WjdqS2JuL0V4RThCUjk2alhpR0Fud29oSkhhMHdiWVYzQXg3aFMrMFBwRGh2?=
 =?utf-8?B?dHZ2eHpBYVh1ek9Jc2JhQmM2ays4ZEZZZCtiY1F1RFYrcUp2V2dMYWp5cStx?=
 =?utf-8?B?TURQQjlxOTUwUEU4bGg2WlBQZ0pZUHBJU0dNRUU3aTBGN2xTclFSY3JwOC9Z?=
 =?utf-8?B?RFlneTRFdU5aYnhsVk5MQjJ4dW5zUEYvcGd4SGlIYnZsV0hiaEpoQ2h0ZWxy?=
 =?utf-8?B?ZGxVdUpKQTFLMzl5Z3VjTTRHMXNrejNVVGJLTE5IQlVhbG93NnBKcGV3cmJD?=
 =?utf-8?B?SFNUTWxCaXpISW00QVh1cFU0aS9kd2ZrWDRiZDBFZ1QvSDFxWkxDcW12OWpw?=
 =?utf-8?B?QWtacmMyRVBSZE5FRkcwYkVib0ZUSVFhWjg5cmxiN0lKbG5VZWJQNGNnOERi?=
 =?utf-8?B?T24xbTJwOFRsZHN5QVJFTW1zSVpWRnY0UlEzVGhjRGE4SnR3RU1VaHgwbHRy?=
 =?utf-8?B?QVlpRWdHTlZFSjgrRXNyMTlwSzRwWFk1cFNqdEZDUmk0NmtQcWxKajNGVmgv?=
 =?utf-8?B?YVRsWDlZZCtQWS9IanBkNThlWDdZUC9HeVR0SC9vOVBMd3IvbFZhVDJnY081?=
 =?utf-8?B?a2RuTDRHOEFNRG43OThpYUFJTXQzOW0rK2VNNiszWkZJU3lrUXJab1AxQk9M?=
 =?utf-8?B?VWF2UEozenh5UzQ5MWwrZFZUWkdXM21OOXdsVU1Rb2ttcFplbzVTUWFYdmFY?=
 =?utf-8?B?UnFCdk9BRTdaVE9MNjNLV2crdHhJS2xqK0dpNG5wZ1lrbENVcUtpYzg2dWRH?=
 =?utf-8?B?aWtvays5LzBSUUtZcE44OGhtNmtEdytPbGlxSktFcTlxZU9Ib2F0dTJFaExz?=
 =?utf-8?B?UjQyUm9Oa1NrZHp2OUQ2OWp6ZDlUNjNROUNDWU9PUW1GVlA4T0t1eFhpZUdT?=
 =?utf-8?B?dmRXdzBSTlA4K0p2cGY3N1lmRHpSaFlLRW93VGJibVBEaVRwbVJrSXVTSkMw?=
 =?utf-8?B?Rk1KS2xjU3RMaHpzNStzNTZEQ1ZEbWw5dEJyTE15OGF5L01xV2w3TlN5enVC?=
 =?utf-8?B?N20vR3JGT1kydEtxU0pHQmN3QVpMTTZrWVdKM1hQcFR1Qm0vNXNiQnhGaGx3?=
 =?utf-8?Q?FogsWuNXsiFaBYEUwIVdizvX1HWA5uCJHdYarmaqilIgM?=
X-MS-Exchange-AntiSpam-MessageData-1: Xzl1+76SpVfq0g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8931f86c-600f-4c26-7784-08df387e9ca4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 01:14:15.6641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pib+PeaaMRc9JDrWL79vYf2EBfb0aN+vu05l5Yn2rXm8j69d9hgfz8liedUBgCZoUfnWdnovRjmnX7+wSIflFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999227

On Fri Oct 30, 2026 at 4:41 PM JST, Alexandre Courbot wrote:
> OpenRM defines these registers with a stride of 8 bytes, so reflect that
> fact in our own declarations. That inconsistency went unnoticed because
> nova-core only ever uses the first register of each array at the moment.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

nit: should this have a Fixes tag?

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

