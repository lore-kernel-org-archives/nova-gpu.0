Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793154106;
	b=e/vEoBwCO5T8nTyaVVtaCkIomFXOCUdnu+hBaVMh2FsZZlLgiYd15TIDvyILBYDPXDtW
	 YltlPAh9qz6GMKr9g9nfhYhAmB+WS0/k6OUapB6JeXZvcgvkeM7qVaifnQ3iagXhU/cdi
	 6DyOkvtDVvC/UNuGDROyxzkFmZuVRgbIB5muC3jLcbYP46lMmMEWn9EqHLOF+O51LcQMf
	 JIJWfu3PgJdvd0duaGFBXnQVAp8jPPxNO3HPzFK2defjRTc58yXFxIzAhFnrHHOjjBk+S
	 2/jD2msh4ebZf3/3s44Wv8sxAp8WTJzQnaY4HxQqlYcOcYDwGHB1ksKVstAn3oXf18w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154106;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=SUomFkxSHI8uWamssyGyXIeHOrLPSgYwyt/b1z0mi+M=;
	b=3zUHTWbUQIV48l8FdzZ2vFp65IRkMI8J7Cfyrxd6ePMMeRz6+dntr9Tp+X8Nhex/PD+O
	 iTdEJ0cgrpQouAvrf13BOu4x3/S8qKmzEkR/8wlXpI+mDFOFh4Y768a8k0NL0v7XzqaGd
	 VVF3ciKp8WYbDTvKjjXJAbn/SWQX6SZNQa2Zvif1F0gW008b9d8xrs3qVXRdS5DcUPj/g
	 uQElz1Lbj/Wpm0mcJd8b/auc1T5pOTizMQtTbPx8yIL+h179VLNWqiFL+g0pnuOd6V9F7
	 HmiHFfNYcBBBuHX169AqzjOsNyuU5xLLYYU/GJ/k5mJLA7O3/TKlFB0EZXK3VUgI8eQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bZXv01yX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.34
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011034.outbound.protection.outlook.com [52.101.57.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E04F606A32A
	for <nova-gpu@lists.linux.dev>; Wed, 28 Oct 2026 02:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E04F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bZXv01yX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGYPWbeLteMteqpQhwCMHxHDXeOOmssVDExqELw0LzkbP9u00knd6hJTigsrczq8liE/xIQ3n0DgoZJWH8MrpHbXlh4XI3XoX1LT31IWPH22WRiUfR1JtILQ01IQ+puLTgOuq3FcgrvCu1EfrEBSEBSCZjDs4R1yUMZpAoeS4XzpEOQHdu/jATAAoLLNlFcTngwJj6sRGWzNfiBgGCJvdK5Lc/ow37EKkUyKoJaB/YlHmos9y0+jMLTty3aEnrzPEFQSVZ7PO5XypLWwJeamUZsvOrPN+mlPECjSsB5HNyYnWAf8jFW7h9pVQJ2JhJpgS582HStCCgJoXKqNw77xfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUomFkxSHI8uWamssyGyXIeHOrLPSgYwyt/b1z0mi+M=;
 b=MwlXH87wxt8y2ieTQ+Qs3Lntmll+4vsKYsn2iSUG6JjaDUkTL6C4xYF8Fk9Ihktmohrqrf2b+xljMWpHXf7S16t7MsL1zGB2YhK/cHWBxvNYihhcxLjc3ny67GFtt8W430ldIPugvvtrUPqQCFKo4LQB6EDtHxk8X/GWeCFZ9Z7t1XC67l/YJeQA1kJQrEDgIbJt0f/Db7UjYDhhaKjBL/KJ5B+0pCBYHAP/TktsFs2Uu7gqrB8jLgM+toN+XI+eAhi556giBjNQPNmBWAsYwb8UvaFkTMYwyqqxc1n0JJxP4kT+dozc2Sw0XaJrJf4USaLb/DWCWi4+7hAPpsX4UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUomFkxSHI8uWamssyGyXIeHOrLPSgYwyt/b1z0mi+M=;
 b=bZXv01yXgTuMKqgrSHOXkQdAH1GpSbHBpDI2eNCSdtdUM9hzt+g8vVTtpuSUMgdbMu/CcJyenfmlwseqH4/58fxPr976gQMvcP4artxjZ8VqED2K1x8MKTXCiWIXa3Y6ZqRFBnE0ZEe+omXGz8wwSt8gAPNgpoxkq/Z1JNQ5kHxBENdtj8Mx7HKQQf2PCrScSwLE7MxsdQfnTj3x47huHiiZzKs8JvsVe3QEORc0bhHjsAxDu0V/1EmicclNoNlwoyoTFgrI/mJhq1/3vjh/CJiaPIF62HfkH3fpX9mMbyb+Vx82qa0Thh3Q3YfLojonpOSdBqVHcGVV/+I0RLQnyA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 CH2PR12MB4086.namprd12.prod.outlook.com (2603:10b6:610:7c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.22; Wed, 28 Oct 2026 02:21:39 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0546.016; Wed, 28 Oct 2026
 02:21:39 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 28 Oct 2026 11:21:02 +0900
Subject: [PATCH v5 3/7] gpu: nova-core: add NVKV encoder
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-b4-nvkv-v5-3-ef78909b513e@nvidia.com>
References: <20261028-b4-nvkv-v5-0-ef78909b513e@nvidia.com>
In-Reply-To: <20261028-b4-nvkv-v5-0-ef78909b513e@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYWPR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::12) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|CH2PR12MB4086:EE_
X-MS-Office365-Filtering-Correlation-Id: 57addc28-5bbb-4d41-7ee3-08df349a3300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|23010399003|921020|11063799006|56012099006|261022113327099003|261009223027099003|261022105027099003|261021135927099003|261022075727099003|261026121527099003|261021121427099003|261026140227099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	FQ6FfFSfGAvB/PjCW1ubb0XExDrNlOTaqvXEdGI9FJ+JnlGb+TjLO3quQ4Les4sxzRXrP1IAMl8cxyhVi6MfzRhlRRSM1dbMRPzKTaiXXTTPgU68fuBmtNL1Ldg1+CPX9qAuIZXz4EcH+ckUvnLD3A1+MTRYWgCC0uxa3SO6FZRg2vfaa/1t39UgvomZexOQpvllOuL0aQ0ooNU25dzlwupj/p+1VDKs6efWUIij5Kpxxge00AVDc+bBcDL3pYvHdvSDy3HYP3Vj06HE4ByI9gFI5Tboo3PMoA/CA/Z5DXcV2KNByql1mxbPvbTQacFsZo0ejP3bxNESDSc8t/CRli/vVk1FhSf5EKp2KW90cUU0mwY14rl6piifpO6jaN6XNBj80u/1CrjD3vWSaE3b/FrQIBsG2jLobcfSA/MtFMT+bsgd58lxBzkJ1EQWmEWeV05KiQhYrnPnRaoaYOasppzmzlbkue0MvXp6I2DjLAOJfbz7oqpCxr1FjCxYkKOKwg8RVKWQKYamYV5keFOMo62iR2c9NuoG1Mkkal8wbQsnap7/SqXGbfMraeZK2tj0XA0apqm0KUhXXl2f1UyWXUh0eK+y9ZWPa6VBZhxcYo02hxpGOXTH7hNgHvSN7JuQvyvvhNdPJUe5mNHh7RaQ4KY10UozZgY7YcahWtUre0iIHNDYFKpWhrau+aEP6L5u/VHVOssrKP76nIkJ2HlbZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(23010399003)(921020)(11063799006)(56012099006)(261022113327099003)(261009223027099003)(261022105027099003)(261021135927099003)(261022075727099003)(261026121527099003)(261021121427099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qncwd3FSU2RsQVhZNXFCanNQZ0FGVFd2UzJpQ2VZQ1RWOW5PVHpTQmVLMG5C?=
 =?utf-8?B?WnZUc1lYY1dvYkxHSkVmNW1TRVQ1d2hUbXZEbnlKdnAybmxiOHRpQWhPT2x0?=
 =?utf-8?B?NnBVcGNKYVJsOFlKalZUTTk4cWdSYytMTk9rd0pzZndMY0k4NFlTRGxCemR3?=
 =?utf-8?B?V0JDMnkyK0VYazRNMjZsSUtLbEpYMFdFcjBON1pKWmg1T2x3bVhXeGNvYk9z?=
 =?utf-8?B?QUIySktjMm8wcFRzZTU4VURWa3FKYmJqTldybmhNSVBMcnhCT1hqTTAxRWZT?=
 =?utf-8?B?WmI0Rk5JVUlhNGl5S1J3dlVwbkF0NFU3S21NWHFYVGVUcVl0TjZFR0Ntd0M4?=
 =?utf-8?B?VGprL3d0STQ5aUU0REZUcWRjcFBsR1NYeWdCdE5kSEtDM3VzQmtUeWQ4Ry96?=
 =?utf-8?B?bFlibW0va0ZkMVNvRDF6TTRDL3MyUmJxaStWZFBNdEt3dWh3Rlh5bkNXN0Zh?=
 =?utf-8?B?L2N6RXhDN0tBWncxWlZGYnhUTSthVFMrOXl0dnhRcG15OHNCcEtmaXhHaG1w?=
 =?utf-8?B?VmljYlAxMHdKcXdkQi9kSFUyK0lZVzlYci81dUtPT0xSckRGT1dZZmYzZ1Zq?=
 =?utf-8?B?ZnRzRGNWUCs4R1ZOamtPR3dsbENFejk1eFVFVDhNRDdkSTl0OHJiaC9sQnhn?=
 =?utf-8?B?VFNoR3Fpb3FoSzYyMG1LeVlxM3hXZmcyUHNxSHhzL1BLSHR6Q0JubmorOG8v?=
 =?utf-8?B?eXE0MzI2WDJ2L010REpuQXJ3STJJRWhHazFQcFJZNXFsN0F6cHJvek9KM0ZG?=
 =?utf-8?B?WXhiUzgybnYzNVBWaWI3NHB6a2poWXg2NDZVUlpVOFpIbDhaUW9JL1VUTnNU?=
 =?utf-8?B?N3ZCTVdOL25oVk94M0dNWWlVL1hvZTFDalFXMHNvZHZqOE5RcUNmbDhybkM4?=
 =?utf-8?B?eXBwNmczMVl2dlZSNWdDM2pNRnFlLzJWRHRlcmtBWDBwQjNLRUw0K3k5MWs4?=
 =?utf-8?B?Z0ZEQ3VYelRRUDI5c3ZiYlFOY01vVXNPTWU0R3pxTXo4QlhjTjAyMEdYY2dK?=
 =?utf-8?B?MWZRU2Jmc1ZJRm9HdFNvSjJ4dDJqbHk2Y1pxRTcyTUxWNkF0QlBid3pFMWU2?=
 =?utf-8?B?a25ZU2dpV3ExRllJYVplaDluVTVqQlAxWEhMYldDQm1YVlQzbTdqRDBGb0Zn?=
 =?utf-8?B?SmRMMDlTOVRnaWt5SU5JOTNrR2ZWSXhoaW9memw2MmJBMTdiRU1uRUdDYWVS?=
 =?utf-8?B?VDB0Y2lWOHFYaEd3bmIvbWZJSWpxVjVhOC9Lbk0wVkFyUms1TTNtclZDOGpK?=
 =?utf-8?B?a2VzbXR5V0lwRWpFRDM1Zk9QczJCTnF4aXRncXJYd3pqeWJrUTJ6R3ErOURC?=
 =?utf-8?B?MmQ1S0hvT1p6d2JjVkZRV01uam0zOGdpbUZSdXlLNEJQbnlJKzN6bDhxUFI0?=
 =?utf-8?B?ZEFEMmJmeURQS0JYUmNvYTc5QW44VFRXekQ3SElrNC9vdVo2eEh3cG8xaG5o?=
 =?utf-8?B?cHpyRFVUNHlDU0NRcm81RmZlbFRHWkxpRGtWa0tyaXIxOFVqNytkVGZwT1Nm?=
 =?utf-8?B?ZmVMTjc2VmlPak5oeXQvZTJtSjBLMW1wZmJBRm9TN1JyaE5EODNUck0xY3lC?=
 =?utf-8?B?YTVqbFhLNnZsSms5T0s2bWUwV3pDcUFxU1VTaEoyRzU4M3RiWndsQUI5SGJr?=
 =?utf-8?B?V0lrbTFIVWo0Zkx5UG96aCtRWkNKL0pLSmp2UUVmYzZ2ZVlZMWRrRnE5V3F0?=
 =?utf-8?B?c0ErbmRCdGxDYjl2U2pNY1BvWlRnenFXd0V1bTA5OUlnZTZKZkdTYlhCL3dT?=
 =?utf-8?B?V1dNT3M4UkxMV0hVaTNHbE45MmZRNkVBSlFvL3RnZXh4a0xGUTRLWlN6ZmVV?=
 =?utf-8?B?a1ZsNEZ4ejE1aHRQbGtPTTA4L2xSQXQyV3F3bFdKTjJBdGxBenVROXR0Q1BU?=
 =?utf-8?B?eVViRTVzdVVJOTllZmVlRGdwMkYyMGFCZUtWOVg0aFBYdjVlSXRSZmhjcktu?=
 =?utf-8?B?NDdXbUVJLy9Mb3BVYnNzVDhZcmlubFo1eC9NY1NNWm9qWXBpVFpndkQ3Y3dL?=
 =?utf-8?B?U1oxVEdDOWEzOTJhTjNCMlM4NkJUMUFuZDJqdzYvWE1pWEUzSjN2TnIrTHdi?=
 =?utf-8?B?eFFrRWVHMDNrOFo2ZnlWdGRNM1YvVnY5ZWJzbTZwSDhNZldaNWxyWFhCTU9R?=
 =?utf-8?B?ME9SOGU5R28raFNycCtMN2tJOGs5ZllMZVNLamdDenFFNEhaYmszRmJ5K3VS?=
 =?utf-8?B?WERYclo3SVhaZ2tVNS9vazUwNHlVRi9hdUpaVmd1WlVpR3cvZlM2MW9CWUpZ?=
 =?utf-8?B?djZqZzdUalduTGFOR0dtZHBiRUdubEVVNGFFRGk1Rm1VemF0bVUzWXF0WmJO?=
 =?utf-8?B?WVQwYWJHckdZRWxOcEx1c3BxOE9oTEFnRFlrRTdPNS9WL1JlUDFzSGgvOHdY?=
 =?utf-8?Q?vcld/l44ga7wX7WkUzHch/F3xJGWfY9FTmqjV1xvV7E3+?=
X-MS-Exchange-AntiSpam-MessageData-1: huF33JsccndpMw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57addc28-5bbb-4d41-7ee3-08df349a3300
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 02:21:39.6420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPqhOztQjXekmFzh2udO7fLGp4dwpilRBXgl/5IW9BBdCmBmLR8a0febZSGlUgzW1XajwwQdTF8nqNvu9qhUTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4086

Add an encoder for NVKV, which is the wire format for GMCAPI. The
encoded stream is a sequence of 64-bit values. The first 64-bit value
encodes an op word which describes the function of the next N values.

Essentially, the format encodes a sequence of calls to some function
f(key, index, value), where value is a [u8], u32, u64, [u32], or a
[u64]. The key is a u16 and the index is a 12 bit integer. The
interpretation of these function calls is per GMCAPI.

Add tests for the wire encoding for each primitive.

Co-developed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs             |   1 +
 drivers/gpu/nova-core/gsp/nvkv.rs        |  58 ++++++++++
 drivers/gpu/nova-core/gsp/nvkv/encode.rs | 192 +++++++++++++++++++++++++++++++
 3 files changed, 251 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index dda58095f40b..a4a6bf7e2df7 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -24,6 +24,7 @@
 pub(crate) mod cmdq;
 pub(crate) mod commands;
 mod fw;
+mod nvkv;
 mod regs;
 mod sequencer;
 
diff --git a/drivers/gpu/nova-core/gsp/nvkv.rs b/drivers/gpu/nova-core/gsp/nvkv.rs
new file mode 100644
index 000000000000..f1e63e6c4927
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/nvkv.rs
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! Codec for NVKV, the binary key-value format of GMCAPI.
+//!
+//! Essentially, the format encodes a sequence of calls to some function f(key, index, value),
+//! where value is a `[u8]`, `u32`, `u64`, `[u32]`, or a `[u64]`. The key is a `u16` and the index
+//! is a 12 bit integer. The interpretation of these function calls is per GMCAPI. Generally
+//! speaking, the function calls will map to some struct - for example, f(GPU_NAME_STRING_KEY, 0,
+//! b"some gpu") naturally maps to storing a &str with the GPU name.
+
+#![expect(unused_imports)]
+
+use kernel::{
+    bitfield,
+    num::Bounded, //
+};
+
+use crate::bounded_enum;
+
+mod encode;
+pub(crate) use encode::*;
+
+/// The identifier of an NVKV key.
+pub(crate) type KeyId = u16;
+
+/// The index of an NVKV value.
+pub(crate) type Index = Bounded<u64, 12>;
+
+bitfield! {
+    /// The op word that starts each NVKV operation.
+    struct Op(u64) {
+        15:0 key => KeyId;
+        27:16 index => Index;
+        31:28 opcode ?=> Opcode;
+        63:32 value => u32;
+    }
+}
+
+bounded_enum! {
+    /// Describes the format of the following NVKV operation.
+    #[derive(Debug, Copy, Clone, PartialEq, Eq)]
+    #[repr(u8)]
+    enum Opcode with TryFrom<Bounded<u64, 4>> {
+        /// A 32-bit value in the op word.
+        Imm32 = 0,
+        /// 32-bit values for consecutive keys, starting at the op word's key.
+        Seq32 = 1,
+        /// 64-bit values for consecutive keys, starting at the op word's key.
+        Seq64 = 2,
+        /// An array of bytes.
+        Array8 = 3,
+        /// An array of 32-bit elements.
+        Array32 = 4,
+        /// An array of 64-bit elements.
+        Array64 = 5,
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/nvkv/encode.rs b/drivers/gpu/nova-core/gsp/nvkv/encode.rs
new file mode 100644
index 000000000000..ca4189f35feb
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/nvkv/encode.rs
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+#![cfg_attr(not(CONFIG_KUNIT = "y"), expect(dead_code))]
+
+use kernel::prelude::*;
+use zerocopy::Immutable;
+
+use super::{
+    Index,
+    KeyId,
+    Op,
+    Opcode, //
+};
+
+/// An encoder for an NVKV stream.
+pub(crate) struct Encoder {
+    stream: KVVec<u64>,
+}
+
+impl Encoder {
+    /// Creates an empty encoder.
+    pub(crate) fn new() -> Self {
+        Self {
+            stream: KVVec::new(),
+        }
+    }
+
+    /// Returns the encoded data.
+    #[must_use = "encoded stream must be consumed"]
+    pub(crate) fn finish(self) -> KVVec<u64> {
+        self.stream
+    }
+
+    /// Appends an op word and the bytes of `payload`, zero-padded to a `u64` boundary.
+    fn push_op<T: IntoBytes + Immutable + ?Sized>(
+        &mut self,
+        key: KeyId,
+        index: Index,
+        opcode: Opcode,
+        value: u32,
+        payload: &T,
+    ) -> Result {
+        let op = Op::zeroed()
+            .with_key(key)
+            .with_index(index)
+            .with_opcode(opcode)
+            .with_value(value);
+        let bytes = payload.as_bytes();
+        let payload_words = bytes.len().div_ceil(size_of::<u64>());
+        // Reserve so that the stream is unchanged if the allocation fails.
+        self.stream.reserve(1 + payload_words, GFP_KERNEL)?;
+        self.stream.push(op.into_raw(), GFP_KERNEL)?;
+        let start = self.stream.len();
+        self.stream.extend_with(payload_words, 0, GFP_KERNEL)?;
+        // PANIC: The vector has at least `bytes.len()` bytes from `start`.
+        self.stream[start..].as_mut_bytes()[..bytes.len()].copy_from_slice(bytes);
+        Ok(())
+    }
+
+    /// Encodes a 32-bit value as an IMM32 pair, with the value in the op word.
+    pub(crate) fn encode_u32(&mut self, key: KeyId, index: Index, value: u32) -> Result {
+        // TODO: Consider automatically merging sequential keys.
+        self.push_op(key, index, Opcode::Imm32, value, &())
+    }
+
+    /// Encodes a 64-bit value as a single-element SEQ64 pair.
+    pub(crate) fn encode_u64(&mut self, key: KeyId, index: Index, value: u64) -> Result {
+        // TODO: Consider automatically merging sequential keys.
+        const KEY_COUNT: u32 = 1;
+        self.push_op(key, index, Opcode::Seq64, KEY_COUNT, &value)
+    }
+
+    /// Encodes a byte array as an ARRAY8 pair, zero-padded to a multiple of 8 bytes.
+    pub(crate) fn encode_array8(&mut self, key: KeyId, index: Index, array: &[u8]) -> Result {
+        let value_count = u32::try_from(array.len()).map_err(|_| EMSGSIZE)?;
+        self.push_op(key, index, Opcode::Array8, value_count, array)
+    }
+
+    /// Encodes a 32-bit array as an ARRAY32 pair, zero-padded to a multiple of 8 bytes.
+    pub(crate) fn encode_array32(&mut self, key: KeyId, index: Index, array: &[u32]) -> Result {
+        let value_count = u32::try_from(array.len()).map_err(|_| EMSGSIZE)?;
+        self.push_op(key, index, Opcode::Array32, value_count, array)
+    }
+
+    /// Encodes a 64-bit array as an ARRAY64 pair.
+    pub(crate) fn encode_array64(&mut self, key: KeyId, index: Index, array: &[u64]) -> Result {
+        let value_count = u32::try_from(array.len()).map_err(|_| EMSGSIZE)?;
+        self.push_op(key, index, Opcode::Array64, value_count, array)
+    }
+}
+
+#[kunit_tests(nova_core_nvkv_encode)]
+mod tests {
+    use super::*;
+
+    // Tests that each kind of value is encoded to NVKV wire format properly.
+    #[test]
+    fn encode_all_value_kinds() -> Result {
+        // All keys, indexes, and values are distinct but arbitrary values to make it easier for the
+        // test to catch bugs in the encoded output.
+        const U32_KEY: KeyId = 0x1001;
+        const U64_KEY: KeyId = 0x1002;
+        const ARRAY8_KEY: KeyId = 0x1003;
+        const ARRAY32_KEY: KeyId = 0x1004;
+        const ARRAY64_KEY: KeyId = 0x1005;
+
+        const U32_VALUE: u32 = 0x1111_2222;
+        const U64_VALUE: u64 = 0x3333_4444_5555_6666;
+        const ARRAY8_VALUE: &[u8] = &[0xaa, 0xbb, 0xcc];
+        const ARRAY32_VALUE: &[u32] = &[0xbbbb_cccc, 0xdddd_eeee];
+        const ARRAY64_VALUE: &[u64] = &[0x0123_4567_89ab_cdef, 0xfedc_ba98_7654_3210];
+
+        let mut encoder = Encoder::new();
+        encoder.encode_u32(U32_KEY, Index::new::<0>(), U32_VALUE)?;
+        encoder.encode_u64(U64_KEY, Index::new::<1>(), U64_VALUE)?;
+        encoder.encode_array8(ARRAY8_KEY, Index::new::<2>(), ARRAY8_VALUE)?;
+        encoder.encode_array32(ARRAY32_KEY, Index::new::<3>(), ARRAY32_VALUE)?;
+        encoder.encode_array64(ARRAY64_KEY, Index::new::<4>(), ARRAY64_VALUE)?;
+
+        let encoded = encoder.finish();
+        assert_eq!(encoded.len(), 10);
+
+        // IMM32 has its value in the op word.
+        assert_eq!(
+            encoded[0],
+            Op::zeroed()
+                .with_key(U32_KEY)
+                .with_index(Index::new::<0>())
+                .with_opcode(Opcode::Imm32)
+                .with_value(U32_VALUE)
+                .into_raw()
+        );
+
+        // The SEQ64 op word followed by the value.
+        assert_eq!(
+            encoded[1],
+            Op::zeroed()
+                .with_key(U64_KEY)
+                .with_index(Index::new::<1>())
+                .with_opcode(Opcode::Seq64)
+                .with_value(1)
+                .into_raw()
+        );
+        assert_eq!(encoded[2], U64_VALUE);
+
+        // The ARRAY8 op word has the byte count. The bytes follow, padded out to a whole word.
+        assert_eq!(
+            encoded[3],
+            Op::zeroed()
+                .with_key(ARRAY8_KEY)
+                .with_index(Index::new::<2>())
+                .with_opcode(Opcode::Array8)
+                .with_value(3)
+                .into_raw()
+        );
+        assert_eq!(
+            encoded[4],
+            u64::from_le_bytes([0xaa, 0xbb, 0xcc, 0, 0, 0, 0, 0])
+        );
+
+        // The ARRAY32 op word has the element count. The two elements follow in little endian.
+        assert_eq!(
+            encoded[5],
+            Op::zeroed()
+                .with_key(ARRAY32_KEY)
+                .with_index(Index::new::<3>())
+                .with_opcode(Opcode::Array32)
+                .with_value(2)
+                .into_raw()
+        );
+        assert_eq!(
+            encoded[6],
+            u64::from(ARRAY32_VALUE[1]) << 32 | u64::from(ARRAY32_VALUE[0])
+        );
+
+        // The ARRAY64 op word has the element count with the two elements after.
+        assert_eq!(
+            encoded[7],
+            Op::zeroed()
+                .with_key(ARRAY64_KEY)
+                .with_index(Index::new::<4>())
+                .with_opcode(Opcode::Array64)
+                .with_value(2)
+                .into_raw()
+        );
+        assert_eq!(encoded[8], ARRAY64_VALUE[0]);
+        assert_eq!(encoded[9], ARRAY64_VALUE[1]);
+
+        Ok(())
+    }
+}

-- 
2.56.0

