Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010054.outbound.protection.outlook.com [52.101.201.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF743B9DAC
	for <nova-gpu@lists.linux.dev>; Wed, 17 Jun 2026 07:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681111; cv=fail; b=D0Kn8a7yIpkVVyXK7Wp3o0yOEYqY28cG6CIQFM/EblnMV1G5NQmlIJVX7gJxo1vtt1CYfBZtfB3/OI6P7Um/7TQg4MjWNK/kR0jfJv+6cWgOXJzItGMkJg3+QN1DJZtsol9bRgfTI7MG4DYdob8tqBSK7MkLGNhUE+gerXin+x0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681111; c=relaxed/simple;
	bh=+67p4a7RqY0ju/76u02oB/29XGkGsLUZ7MzAz5vnuWs=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=ZAFZWuX4LlxWe8nQHkwSuWqknuCFB57ThW8mJLRqqvXpNB/yeb3eFRkfYWeKJ4CY+VX2kLIYnTm7JyDfcPAdl8XzXR8iki8vE28odMx4ylhk3t4vi1TJCcBUUB5ezjVHIofXIfVt+lMmyuEmfJ2Mict5UMv/RGHR/m9KLwDjd+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BNBEZ4Tl; arc=fail smtp.client-ip=52.101.201.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BNBEZ4Tl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4htwODf+Nzrn0Rdxk4PGLXWIzRL76aIYFQRL+Ve+KyFrUboaSpGUdIJwtXhXQctvok024+wOUm+Kc6LFb6/ZygG1e46ZiipmBKBDaGEAacHpoJV2jAySfsLF6EYuTBTaCDoCq9SJ35p+3qSrHrq5HFvobiPmaVbyt/6ZVFAZtZNEzR5OgsyBb0atbdINvEVHrGvW/49D9uukXHR/cgTjssnk51i3TbGOeEoUf1HMiq33LVagf6fkX+3DykNsOoiSdvm/HbiTxPLFT38rcVEAZLCEoBVdar7lb9+6kc9el8TFW60OQQpmXKAh4oeo8k1nn0PybG56zDOUDn4CO569g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZr9kLHJPwv43sAEO0SKRzC8cVoTH2oxl+xDxhSSeRo=;
 b=hSk6ycsV39K5ufEvHwf45xrO14YyvHHpXIHka+Wvjvwe8M1k4lFYiRZq+A4xxP+aX0ng6iDJA8XJZPm6Q54F9/VpZ1wN9OPp0h3NeauRMMEldlfAJeW6N9TCYI60cgUqTw3cCwI0NyGfzsBBWIe056rLy+Ghuh7H109NO9FwFK+OBERTBUxnd/yU4gD2oTrajx4nSjJ6x/o9WpCcifDr7NU9SxP0a61uJgO1HPawhZAml3YnY2HIaWVw+v4bLzHtkiCJc4l5PcDrFaVDXXt++ysvSUZGHH+skzKyV25RLAQyc2xdttDGLvZ8wTYHvSCmi5j8Qwxlg1a3djG/ZXRA3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZr9kLHJPwv43sAEO0SKRzC8cVoTH2oxl+xDxhSSeRo=;
 b=BNBEZ4TlWJrdm08ONWcxamUnZcgorncNQuxCpm1Rra2l2m/uBn/6vpNtUOtZdcY3H1xJ1CMNc8wygoQWwn/cacCiWOqDqVkq1A+urkNcGp+UxT3EXzPgozL0G/rZ0/vTDBdULdkc4rH4ZydBQsKHie24r8EqlGmi+FOw3uioB2aWbdA0DdY6CFtRDsTqgJc5bfIHmfXx9XhK0APrh/WSDofrkCiR+trV4sdFMwyP8wM3Qc5LYRlwWT5AaipTBCu0MgUXlg25UrUgrk8IeQcB29oC56NiHV/DRcadF7O5bF60b6ktrgUMchWeq6/QBNBQ92DeeWL7yyq6K7ZIjs4QTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8651.namprd12.prod.outlook.com (2603:10b6:a03:541::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 07:25:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 07:25:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 16:25:01 +0900
Message-Id: <DJB58ML5VLI1.RGQF497LUXYT@nvidia.com>
Subject: Re: [PATCH v2 0/3] gpu: nova-core: fb: Hopper sysmem flush fix and
 cleanups
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
References: <20260611011901.84517-1-jhubbard@nvidia.com>
In-Reply-To: <20260611011901.84517-1-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8651:EE_
X-MS-Office365-Filtering-Correlation-Id: e4b80d2c-b366-43d9-a725-08decc418d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|7416014|366016|1800799024|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ojVGfZ1uFVxsFr0jT6CV3VM6gbH0+Ioh5kJuwFsEMI6yVgi9ZWrBdE2WOJZEI9Z8PJMb0Vjbh4C9rgUmjDwsFZzjpY801Iv2LyjNTGS+/fhL9Z9tPw80fnLHILVuaBKIrGnI5ajXFaxRnC0EQYuom1ABv59c4Flyt5r4wZ0HbiOzU7B1N+5LJNwFaJU5eOxbbXUcLbtoFlGly+rI9cC5O5l3hkr9z69/KgYVFzByv1sABWCaO52D3RyxjUAaYergg6EkMOUw92HklBxhSe1haxG5qPAwVToP3oebDGuSfMCYlBZ7N03OvT7KbGK7xFVeASwsShjWWVzmPNnnQ8qUlBCIMlzvrsdXkQNXOR/Ch0yE+lCtorVOhzC2ejJZSWmfStMUZoUiajn8gncb1bxqbJ+Iojl86sk4GhQouXF2evA64ryJ3mQ8MzFayarfLFUaODV21ohKUOcRbkEMuv/Adf/THQbbKM7deO2RA8960zLDbU8Hk4EcWlK6cmrHYxYGHlBwJigtjfKEj/QNxEZqIhGAIPnHhMZQdxNHSP+RijuBtjVqDXCp6g/4DJ6qURZnNgWDUVlR9aX3LloYxRCd1x56D71lr+JDiv8YhFDz5NzwOib8B3KEDwStbP0rCcTdSYPkXf1+GSPhmK5FcSKbS6ShRdYaXCKNP05CPa8UvowmeRJ7SCwiJgKoYIi3tHnM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(7416014)(366016)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVB5VWlzZERtdkFsajk5elFOV3pLNzlMQnNCWitwRjd6QjdtZ25CN0FSNno3?=
 =?utf-8?B?eHRqSmd6cWlDWGl1M0RNbFpaM2xtWTM2aThNN2dwbzRKbUlGUDZVYmxzSi9U?=
 =?utf-8?B?MGxVZzRlbWQrMmtOK0R6R096dFd2M0pZR20vcDNDcHROZnYyMnp1WDdjTEMr?=
 =?utf-8?B?VTNGUVFIemlwODcyU2dPSmEwa2xoVHQwbm15R0wySVBLM2lQM1ltcDRtUGJz?=
 =?utf-8?B?a3VLSTlZYXBDbkpYVDB5ZnViTHJiSmNyVDNuT3kyV3BYTExLME9teFRPZ1do?=
 =?utf-8?B?UG5XSDVTdVpJcCs1SUVaeWNXYXpCbjAyOUx0ZnpGeXBsT0JxdUY3WHFvOHlU?=
 =?utf-8?B?Ym5XK2V0elBjdWtpU25WN2NhY3RENlUvd0Q3ZUE2b0ZUaHR0Rzd2cGN5T25i?=
 =?utf-8?B?eFNnSHFBMGc0RnBLSVMwbkF0M3hpZCtOTzh1SFpSZ3k2clpHZ2k4R21TcDdD?=
 =?utf-8?B?ZlJpc0xaWi9wejh5bTNaVjlqN2RVa1RobUlON2FpejZhUWFGZEY5Znc3djRP?=
 =?utf-8?B?L3M3QVZmVmx4bDU4RW9tbkVXa1lES0RWTUc0N2JvWUlmY1N2Tk5IaVpFQ0RU?=
 =?utf-8?B?R09SY3NGWDNaQTE5S2VtMm9Gd0JqR2pNWnd4NWFzZ0JLbTAyTkJzbE5obmlI?=
 =?utf-8?B?VndHSlUrdjBFU3hYRnBSTTJ5d2tFWlhmQSszVVAyRSswUm9IS3U0R29QTzNy?=
 =?utf-8?B?bkl6WElENVptanlsVzlGSnMra2RTVHRXNlNzYjdoYWYxV2dBbTFtbDMzZnlj?=
 =?utf-8?B?QmhXSmZyNE54eHcvTXQ3MDd1ZzZYbnF0cmQ5RHZHRUFqSGJJdGRmOUh3Nkg4?=
 =?utf-8?B?dUhGRXFDMmJsbThlYTB6bmlLUlNDUGJUQkRzZ01JZmZVaDE1MFVtbXJrei8v?=
 =?utf-8?B?L0VEaUxOWWpoNjJ1Vk1BV2Q5OWtqUXVpT29GNHF0ZUNtQzdUaDJoajc1S05Y?=
 =?utf-8?B?eFRyMzd6cXI5dXJXa0JMbWtvdnp3RjBwczlza2JVNEt5VlZRU24zbE8vc3BI?=
 =?utf-8?B?cnJCWmVLVFJFdGxEVHo2d0F6cVo3K0l5a3VLT3czWHhYYTBTZ056bG12VFpN?=
 =?utf-8?B?dWNqVTU1RlFiVWd5NDV6YUtkUGhRV2U0LzVwN3NyZUE0LzVQT1h4bkxEMW0y?=
 =?utf-8?B?NkZFbVhKbHNpSldxT2ZVckl0Sk1STlUrUFRKVldqeWhiRnNveDdabHhQYUN0?=
 =?utf-8?B?ZDY0RTl6QStwcUFCYnpXRHM5YjlvWUZDdWkyNUZHdFYvV1dIWFdKYUF1RDBC?=
 =?utf-8?B?Uzk5cXBOVDdNQUpCeEhvV1JSUUYxbU5yZlJRQUQwall4cGNlUFhmWUNIZmRW?=
 =?utf-8?B?cHFjeUZ2RmxiV0U2VVhCRzE0YlZWcXdodUw1UkJqY0FmTVEyWElXTGpJdnZn?=
 =?utf-8?B?OUJjWEpRMHVlSEpBbVltSWZrZG5FbVRYYjFaaVV0QWlDMzZ0ZlNTUk51cGNq?=
 =?utf-8?B?Zi82S08vWjRkQkNhcWFENmMzSjZxWUFUY1V6em5mMG5ydmx2OUpDQ0kydWVZ?=
 =?utf-8?B?bFdDR0xLWWFLNjRyWVNoMmVkdE4rN281T2dTSzNpWlNCWlFKaFVhVVVjb04r?=
 =?utf-8?B?ZGNXSmxYNXhvanFJSGhhSDh5QjA5bGh4bStOYnpkbkZsTmZ1QVV1TFQ2c20x?=
 =?utf-8?B?aFlYckZuUFN6eGdueVF0RC82N3Y3SnpxbGZwZkZlUUdBREhMaEVVdC9MKzBR?=
 =?utf-8?B?NUZXLzA1cUUrc01vcTBkZDg2NHpOcVpmRFRrdFVEMkhkNVpwbFZ0ZzRIWjd5?=
 =?utf-8?B?aUlIMG90MmFFaEh3eVJOQUtaaVQvRC8vaGIxM2NmUSs5bTRkQ3UzZzlsY3g2?=
 =?utf-8?B?ak5CSXc0UEFWRUhsOFN0Sk9PekszQklVSVBzRGl4aFdtZTBMay8yR0dpbGcy?=
 =?utf-8?B?b09iVWtkelNBdEhNc2FJRVJocHh1eHc1ZjZaYVBKdWJSVVNtV0pEbTZVVG8x?=
 =?utf-8?B?cHVZeTVLbGRXbWtRb3N1azllbUt5NzNlbThzY3R4S21naXNrM1ViRDZqRHdK?=
 =?utf-8?B?YVRab2oxMkVoYjM4VmJ2dnZRdlN1MTVCYVNKYUVUQkJ1ZytGTFVVOElFVzVV?=
 =?utf-8?B?ay9RY2ZqL3Bjd3pIU0ptcGpubFJ5cUZYeXg5U0ZteXM5MmNaSXdDbS8zTVhw?=
 =?utf-8?B?S0RZMlJ5M1UxdzN4dDJSL1o3eG5FVXdDYmtueWxnaVZxa1JxeXEzMk1lcm9H?=
 =?utf-8?B?aDZ1NThHc0dqUWV2YTBwSndXMVpiT3dTSGtBTjFEQ1RmbFBRRlNYWGtQb1Nt?=
 =?utf-8?B?TjgzUXBpMlUzZ25hUUp2Z2YyU1ljQS8yeHdRQWVCeEhCcWlnR3I1OFhua0VZ?=
 =?utf-8?B?TGdmcVFMS3lrbmhTYm1idkxxb09WM2haVmxPSHVJNU1pVEp1c2R3U1BMNGxW?=
 =?utf-8?Q?YGMvJjE1fpcTo/fsn9pKU5RLZrbEpeVL930uEDuFjXXNc?=
X-MS-Exchange-AntiSpam-MessageData-1: +W3KIHQHOPAFfQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b80d2c-b366-43d9-a725-08decc418d5d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 07:25:05.5034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GEOoV3zEV3uovYb5u5xfPQ1DayhnRHyCFnyiaJV4X6U+i/7UNc6BKhMiLgc9PNdHQ4zTjzdChg3PTq9W1oin4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8651

On Thu Jun 11, 2026 at 10:18 AM JST, John Hubbard wrote:
> John Hubbard (3):
>   gpu: nova-core: Blackwell: use absolute FBHUB0 flush registers
>   gpu: nova-core: Hopper: use correct sysmem flush registers
>   gpu: nova-core: fb: two tiny readability cleanups

Pushed to drm-rust-next, thanks!

I have just split the last commit into two ones, as it clearly was two
different fixes, in two different modules.
