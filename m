Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010011.outbound.protection.outlook.com [52.101.193.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622AE374A0E
	for <nova-gpu@lists.linux.dev>; Thu,  1 Oct 2026 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863580; cv=fail; b=Uvy/JkybiPLKt16LN/FFwGTB1aO/LNPAL2c9w9VEnQ+sTaqYcUB38PKqLbpdVKOMUoUiiW3YCqcWjJkfQisOvfI1ECYl/M0YsHcU9Y0WbrKkvaf4W3MjUWls3yki1B91XJLNdylVxrM9O2kM0iKxRf/SK8MHhE/92CGW2bZavzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863580; c=relaxed/simple;
	bh=wWLowvV8EkJXDfzPyxxve/Vx9Uy+1Lm1BbUlkexkYL8=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=YYy/G8jQf1sfpFaCZfuD+UUs7s5PPeiwcnlFv+4jFKzte5/jtNSvKAms5rQJ9waOqQURFNzmL8BmpmaaNUDL4RrQaMgUG1awKHF0EupMDwDG9VL85/OxBpNsB24U6GAXMEcyT35zObVqd+TQOEwVloUvSLM1w8tcaTQcuZOpBtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EN1IhKWi; arc=fail smtp.client-ip=52.101.193.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EN1IhKWi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thvozfnaWY2HO1JsCHbG/j2WtpIEk9GXYXkr69kvBUECXCsaaC+XjQtLdFAe/SgR5qGRb9GImG1+yodRaG0FsIuH3+ypOOGp0rIcxrOM6jFYzkZHowy8x4dXo/rOG0KhfahszOLMrbkaE9AzWdOlGybEFaaK5rZTF6hEaiWMs4hyUgpV5RXMV2IjZxtY64hDhcJI3eGd2wRg0DJy76y8HG0nPGWe4O2NqU+VVdTHt4/DCCqqgQxzlAEW2/MmmIV5LhOb34ZFR7qrP4vwrtjzehW0hNMdopJbPh1uK2KuZM0tl6Eb4x2cun1dDTKiehYcZvgebIZYcrhuq6B1pUWeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWLowvV8EkJXDfzPyxxve/Vx9Uy+1Lm1BbUlkexkYL8=;
 b=DaM4E6NPB0f51c5nTp3ruF37S3uKl+vMD69dISJMIgG77Twf4TACu3L12s9+VlnDiF6HTQbP3D2s56GouyOp+3Ag4q7Cn1Nyk3bS7CsO3JzzUHHf5agItHag7n9PsOuBFZ/WzlsWKfF9LJFJwKmO3gQ9qX4yybjUTeReC5GrQy5TxSR/kWp/MH7q7b/5PCLtkBeG/bAmEvu9MMSlVF5CPOIeaLHr0LWksCwEBixX/uw5pQScnnjsZzuSGo534+DcSe65OqGrnOogowCjbHyTve+G2T3Ysr6eN+DgxdwBn0tLgb8Av0dJ3EjdRV7unbKyzQ2GSy1IGV+muryC4Mhw+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWLowvV8EkJXDfzPyxxve/Vx9Uy+1Lm1BbUlkexkYL8=;
 b=EN1IhKWiBGEZ86MFJL1Gue9NjsR7h85U68R25e9gx3+tHNsKSoiFEuaY+Dny8JVhUkMbBKLhKFtkrVI80PNMAtTEKu0ogIa8gb4r7B70vQOYAzGbDRc97ND/W+/4EDyXKodgLbMfWlHUbxT4sFJl5zAhRl5r+wk1U1DqWKgZSC3i8eRU+43NIla5gq7MGW/jhLHbJ57nzEdPp8ztvN8c133aouHkmo8ifVk6bxXNHDbiPeIEOZDPg4WHIgsJLD6KgEVOOK5QR3JyTiviOpUWntsG9Yd9UgfE3U4Up5EBUQjMJsUvUw8why2tnabcNfmxCteTtsjCSlX39ytf6QKPcw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DM6PR12MB4298.namprd12.prod.outlook.com (2603:10b6:5:21e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 14:06:11 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 14:06:11 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 23:06:07 +0900
Message-Id: <DLTK5HDQ6RW3.3BTUYKEP9JL5F@nvidia.com>
Subject: Re: [PATCH v5 02/15] rust: sync: completion: add
 wait_for_completion_timeout()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260930034148.590687-1-jhubbard@nvidia.com>
 <20260930034148.590687-3-jhubbard@nvidia.com>
In-Reply-To: <20260930034148.590687-3-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0332.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::18) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DM6PR12MB4298:EE_
X-MS-Office365-Filtering-Correlation-Id: f744938d-243e-45a9-64d6-08df1fc525d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|376014|7416014|1800799024|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	+YodG/I+OKuDADOr8JvAW1xPi65yuQIJDV3/RcSW7cE0muSQS1OzX3eA3AxWClIWxf99kcg4/bGff0jr4jKZm1JEefPUgWWrm7tYghnV2ee6dD1qvfZgAJLZF1L/1jMNomwj+wKZkypW6j8ztBg9vFeyj8MzmlC06ZJkjBY2olEuCvAj10sEPH2BR0NomkQuTV3bZ5aLmPYXFOHURF0j7ox/nW8Ix5gV1cnnzEsRxm3JWRc8EKk66lw5BHcSmYN86wbGCvubcQbpa3hwZEmsFCqwIkm6oigVsADQGDzBihhcPwMZ5KHXjWgslLGKG2H5fttbOMhsjfoBs+zOm6rqV4vPGpJsHIqZmpBw6yY2FHKM0JwYrT6yVr0WdnwEW/kcQm/xkmnFcZByLOhuxaXm0AAtrEcMunETpDP236t9NKo3XfgRTMVlNFvntaLF1HP2ba8+jN12P4JrBYwGvJ3wDnZifLzq57lRl2EijyIdLApvnpuKy3NZPzAQkIJsga8uu2kQlwxfhpZMoCxr578Rs783VhNUtXD2nlm+zLS9dNKo7mo+AR7I/uK6G15hHZpTNMa47z2zLS4XptD+xBirVav/U10nCdQ8iOlStBb6X5L8VGesm0wturou3tUjxHpXKCS+kkiQdSivRm5rIrtq6uzsDATvJX35NCTV7SBegaw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkhGZ1NRa3k1aDNQVDkxS1hhVEhkeW1QY3h2eWJScUJLVHlxdStldG91SFNZ?=
 =?utf-8?B?bDkyOGY1T0cvZ1I5VjNkNy85QXQyWFhxYnNGZEhad1NHQWNaOXVVeEZ1YWNC?=
 =?utf-8?B?bDE3YnkrOTlsOHMwbmlKQzE2b2x3RTBqNjlTcVpkQW1YVitZRnFmd3FnL244?=
 =?utf-8?B?TW1sRFZ1TUJTR1RqZFN2QWUzbkNoblhZRmNzRVZEaDJTOUUzcDJIY0hiSHZG?=
 =?utf-8?B?REd2S0VjTjV0c1M0RHZkVk85UUlkRkdMVGxVYVA1S3JvckZVbjNtdXFBNnc0?=
 =?utf-8?B?RjkxVUJ5d1RrVEx5Y1dYdHR0Zmh2aFQ3WXZLdkErK0s5MWpwQzlBYXprbU11?=
 =?utf-8?B?clZZR0RId280RnpmRXBrM2RiaVJQK2VhUW5RMWkxT1ZwNHU3T2FueHNwaDMw?=
 =?utf-8?B?bWZ5eHpWb2dvWC8ycGVWSVhrYXlIQXhQNGpFTWxnbVdhSExpL2FlaEovcG9w?=
 =?utf-8?B?bmJDbkp2QUtSdG03RTQwdHN3ajVkVUx4Z09vOGxweHV5UTdvRjlkUU1ySWNL?=
 =?utf-8?B?VGtmQjFTWGZhN01TQTRDOGpXRDRXcVJ0YlJacGNlb2V1OHpjWXA0eFBNNXo1?=
 =?utf-8?B?ZWV4b3JEZUlSU2JnYXBOY0xxS285cGJORDBxeG0rZVlIM05BakhNSnM5Znd3?=
 =?utf-8?B?SFI4Q0JaWDlwNEY0Uk9xQWNQby9tUVpqOW5hYjB4Ny91b0NONVo0dzdOaVFS?=
 =?utf-8?B?bys2RDFSVjlFZTlXTFo1VTRwSTBrS0hKQU9ib242SUhJclhGTGZRTXRKQmZ4?=
 =?utf-8?B?dE5MbUc5YVFaSjRDS1NqV0Era2JSUVNWWXBsSFkwMmY3Q1I5WmplQnpJUUtv?=
 =?utf-8?B?UkFEN3cvYmF3dXBZRlRwbkRZUEg5eFNVK0ZMQmhvQ2k2dEp3Zjd6RC90SjJH?=
 =?utf-8?B?aUowaE9TSkJqR0FhQ2xpWkJCU2taUmNyTFlKaGRWMWpVNm1JbnVJd29LQzYw?=
 =?utf-8?B?NGpXUjBwTmF6ZndrWVliOWdDZ3Fyck5rV2h6YnNIalkrVERRcUJaK0pleEJI?=
 =?utf-8?B?Yll1WE1rM2pOK0tRMkhzNEt3ZnJJVmJsOTJtcXBKRnAwaGcxNEVHZVRQT1E5?=
 =?utf-8?B?bWJKMnFFTzhmNkZVWlkrTnM1MjdVaTQxcUxDRXpSeklLY1U4ZC85T0RHNFIz?=
 =?utf-8?B?OTBjZHBGOC9Sc1U1a0Vwc1hxTEVuTlR4TUlkVVJTc2NlbjJKODl4K0tLUi9X?=
 =?utf-8?B?UFRpbWZPTWd2RHY4a0pzNUYxQlVNZnhuYW5HUFU3OUxiRjVIVWdTTTRFMkJu?=
 =?utf-8?B?UEllUmM4VXh6c1dRM0doVFQ1RXNhK0xPRnRaSHdYakQ1eUNoajZaN1lhWEw0?=
 =?utf-8?B?MSsvdjN0UjFtNFpRT2ZHalFCV0lKd1hYTmw3NWxweTEyL0o0Y3I5OUtFSkV1?=
 =?utf-8?B?eEY1LzhWVVNDRGF4TVVpdGU4dDdwM0RZNUFUQlhCTnd4bFBPNEMvOGpJTHlU?=
 =?utf-8?B?NVFBYWF0RUNLYVZQYjV2WW92Z2k3cjVhdnFaTERURjFsU1N2a3loWnREOG5o?=
 =?utf-8?B?NjlrZ253Vmc3K05TMGFoN3Awc2tZTXR4UGd6WE9reTAxL1hqb3Fhd3kxVVZX?=
 =?utf-8?B?bmg2VnZDb29CSXlqSzVxSVc3WWRpRXpRSGxudTROemxBR3J2MzNZUlFFQWwv?=
 =?utf-8?B?MEhqZmxobzVRWE41TG1UYU8ydGpPVUo2WUErZFFYNGxPN1k3U0RJblFWYXE0?=
 =?utf-8?B?OEo4T2g1S1F1aUFwZU84Uyt0SlpMNmxlZ05DTHNLdW9IYmtjQ3d4SmdOSUpU?=
 =?utf-8?B?SDNiL0dRSnEwZHpPckhldjIrUlErU2NuWnZTNUlnTWdOb2VhV0FaL3gvNDgz?=
 =?utf-8?B?RlVDeklZaXlYWjFTUm1xZy9vaDl5S3VxWFJkS1dsSitPdGNzS1cxL29CMWRP?=
 =?utf-8?B?MUVNUzVuYW93WUM4d2prc25yK0RjVm5vbjNCUUF1eWZ4K1ZvbzM5NkJhTE5O?=
 =?utf-8?B?Q205UnRNMEQ2QTc2aFhKTFZtcWlZZ0NSbE5pRUh5MHRJWUkwanZub0dGb2VL?=
 =?utf-8?B?V3J0V2NmTmhKd1lGVHVmdVJWWjNpYlE5cGhBZ2VJTVJPNWlUNVJkdG0wRWVC?=
 =?utf-8?B?SU5KeUQ1RHE5ZHk2MXdPa1RyYlJKRGx4cHUyQXE1KzBxMmJMd05mZS9KM1k3?=
 =?utf-8?B?SFhHTDBiZ0FydHZ0WGUzczN6NmtXbi9IdzhqYjY3UWpmNU9LSnhpQTdOTHEz?=
 =?utf-8?B?cDdud3Y1U0NSUWZzMVhZYzdSTzZINTRuS3ZpMjl5dVRRQ1hScjZGd2cyc3c0?=
 =?utf-8?B?Ulg3N25VaHRlcm10NmNhTlZaYUNBd2x4OVdmVEdydExwSzFkWU8vL2lPN0RO?=
 =?utf-8?B?eUswQmw2NXRLRi9xQmQ5L2N6Y0o3ZUJVaEJJdStTZFdDNi9ESVRzQUZtUGJu?=
 =?utf-8?Q?1MehtsvlrcQiQJVuJLx+rmOqQLbflthiu8UZpO0P7ifdk?=
X-MS-Exchange-AntiSpam-MessageData-1: yrXgLKGm5At4Zg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f744938d-243e-45a9-64d6-08df1fc525d8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:06:11.5894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /HgStkVXFXTZFx3iLvwimrrwI5TnSy9IEJj0mct8tS7UCO/avTC+dCjb4yVtD/kEL8WtgFiseKLb7AGI8NDx6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4298

On Wed Sep 30, 2026 at 12:41 PM JST, John Hubbard wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
>
> A driver that runs an interrupt self-test during probe waits for the
> handler to fire. wait_for_completion() has no timeout, so a broken
> interrupt path stalls probe indefinitely. Add a timeout variant of
> wait_for_completion().
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> [jhubbard: return the remaining jiffies]
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Sync maintainers, is this ok if we push this patch through
drm-rust-next?

