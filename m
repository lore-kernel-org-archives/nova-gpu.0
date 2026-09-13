Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021117.outbound.protection.outlook.com [52.101.100.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E654A35
	for <nova-gpu@lists.linux.dev>; Sun, 13 Sep 2026 20:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789331819; cv=fail; b=TR2aABXHzttl4S4R0AjqqomRFkMEaLJKEmZrFmCflSdxQpN3bUVaAXArvjdHo4t9qY63j7Y13EQONSdomsmIKSlKCqyJ+8isz7ogotFKoxDdR7gflMpD6a8w8rasqBLgzhRpS5SDubhncx9kzvM0NFjTfsv/2wPfvwrsFzlYEs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789331819; c=relaxed/simple;
	bh=15TbibaMx7vofSZbzhlmmCiP0nJQDdZFk+WtWJS2y/4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=dGoGTgw/61ezqWVgwuxTboElB1dwUBXoWt7Sdb0M3R1e7wyOKFmNOp1NqxipmQJdmBCcoePGaCMKwEOElNPAZmit+TorafHm3rbUmchpy7JeKwEgXcoZR6bLsDniOA0O0QoY1JDvpu7JLh4jUNJoPzFxMfbhp4DlUzYjS/DR6Ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=I0yNk5Wo; arc=fail smtp.client-ip=52.101.100.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="I0yNk5Wo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlIWb2R21tyHHdlxcHIJbt59wWflRWEAbCdrOc6yrgp5W7oKv4EYpVuKrxhKT7q8uLUr4Hj5R/x2OtvAMbgZOL9t39JSJ2HUU0pLqVJve5FJw2qFVS2Z6kqi0N+EyQhPJoGxp8Rf8Q81fU7ELUmIS6t8mU1nwBnlm44wvmi2snDOvBW1BROHKonJoq2b3+T0Ct6yD4FEAoETD6mvlORfC4PolpMrGg5Yfhyk5ZG4ZkH4d3rU9uIh8UMnnMuuRdVG7IdaspyblV7rrggHwwxuz/HPq+uhVkrsYlLIyoFJWx7Lym9qeClA2+/36osYAs3V6IXaaw0n3B78dalyMjzx5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15TbibaMx7vofSZbzhlmmCiP0nJQDdZFk+WtWJS2y/4=;
 b=qh8A4W608DoZI0etFmLBBaIenIFErggwFQ2yKmz9GpvhMa3MM9MY2h0ca31zg6+fLnN8XPM8RcOb5DvrUEqtmJlKfzqwruKqbGBpY3fVny5wVgz3UOWQuQYA11b7uawf1fU5qv0AHWuTg9cJtcziUUa3URno3rjaA6CIu0HNEszsfSJi/FgJ3E0uvo9WQmAryEDP47LY6+71xGphcf2OAL71pILm536XA6+N1AR+r1jC1bQPQ8ZrG4ktZnlUXhbsJOF0WSIDWv3/Xz9n5GQ/No9hj5cp0SpBHimiZDObw5NC1nkM4jWL21lSFLRKsgzQ1lphSunv4Ei4YnE+XnLyUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15TbibaMx7vofSZbzhlmmCiP0nJQDdZFk+WtWJS2y/4=;
 b=I0yNk5WojKbrYvzIluwEchbL81k0EUh653lLlrEFm/yRd7JqDRt6l0HZFPQpi+549ud3his4LVu1IxrFRulBEi7Ym7wGrKKa0JYokuQqSWFm5b3WvH711MIuXNiJ2YfQPMAEN8NvC8AzvPvAmHLkcNNixbu6pfB642XwiZylL1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO9P265MB8532.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 20:36:24 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 20:36:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 13 Sep 2026 21:36:22 +0100
Message-Id: <DLEH6H1Q3IPA.2WVRSLX0LL2F6@garyguo.net>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] gpu: nova-core: extract radix3 page table into its
 own module
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260913195413.742143-1-jhubbard@nvidia.com>
 <20260913195413.742143-2-jhubbard@nvidia.com>
In-Reply-To: <20260913195413.742143-2-jhubbard@nvidia.com>
X-ClientProxiedBy: BE1P281CA0273.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::17) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO9P265MB8532:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a3a15a-52bb-43ea-be93-08df11d6adc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|23010399003|366016|56012099006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	9s7ZlxpQq0sfUCsxWlXI9UN0E+OHvBWmvYdmgXHwWY+9upCQVEhTn5UMqeWi4yCWEdD5WT8801+hPdOR01Lu3S9gOa9seSpY7gcV7qTj6sbhajcX4UD3GqY62EPH1P+8kcH5kCLjcGz3dn3xBDEUYeMtrAyKtvcVDn+lENsuGFpEFVnkPKYE5MH82li4/BIywOl5gr+FXC+pAyXCCttewwcWp+83k6GJ8UcbU38i+o/66E8lFGFdbf+6ToEJ1zoKsxakxlO3I7ZVpGO0Ou780Siv29/fGBJNiDq6qet2knpq0dOcTDnqthoMC5YtVFnR7wQLc8g9pluWhNVmHp6fxejDtsFm+Yy6RikwLw9pFnGixMQ1D7zxJXveqSjNBJO7fkKvsrewLYa4mYlnb7ieWTcghyMN8YXIkmtGb6rEblToAAUPBEWEL6i9MKszmYpr4L/FDaxmH+RPkRzo6NUPqNb12J3wj8eOSeSIH9hfH3FCL0fAI0BVbdUbzJhUb4rwrccqTQ3r1a896FXzstNg8SeYqHaHh7YRiJvnLx36Qlk7MamGn6cLL/TEaG9s5GxPSXIPeVE2jHbMI771yhXPYvxADzKSkGMGPXC/yf8EQ+z9LxS1D0luk3buNxH3Ib/ejgMKrfcjDrrqq4jOwB944HPaPBFj4Eq+AIGmB+1A384=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(23010399003)(366016)(56012099006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3Q3YWwwa1RUYlVxVk9ZRG5RZGJ2OTRib2RQcDhUNExLL3pETEhiTUZ4TnNP?=
 =?utf-8?B?VEtOMVFlZExLVVQvSUhFN3p3ZWwzZmFMait1c3hNdllqRmM5cTQvTU9rWjU1?=
 =?utf-8?B?M1FqRjNnRDFIVDhscU5mNmNwU1JHZ0dCOHUyTXBlZE1iRUtqVkJrTGt2YzZr?=
 =?utf-8?B?QWlva0trNHB4OHQrcCtEYlJHQWJFQjBkbVl1RGRCeDU0dkt3QlBrTkRGaU5Q?=
 =?utf-8?B?WERCdEpzeGtnayswNXI2bEdzWWphUzhTaU5RUkpIVUtLOEMvSFRtNHYyK3dn?=
 =?utf-8?B?S2xpaVdTNGdRSS9VUGdaVVRaS0VhYjVmQWtMellzV0t5dnQ4SEpjSnJJUVVi?=
 =?utf-8?B?QVJuUnZveThFUzk5U2UvaDNWSUdyTHB4WnZpUDBkc1N3Z29DdW1IdzI1TnIz?=
 =?utf-8?B?Mzl1eml2RkVDMktad3piRHhLdElXaGRsZUhlWjNYWEpWeVZaSy9MSDRmNmtN?=
 =?utf-8?B?Vjd0TzUrWURtd044TDlxMjRmRjNiTFFncTlXTTMxckZzQXBrWW1PTThFSkxF?=
 =?utf-8?B?MU9WVVd5Z2s4Z0Q3NGNNcCt0WCswWDBhQnFTTHF1blh6cWNMSDRDK3pMUnNt?=
 =?utf-8?B?QlQwYm5zVDJoaTFxdnkxdWRoV2dFZ201VDNlTmpxNnhiZXJNVXF2cTVLTHZu?=
 =?utf-8?B?VFdQVFplSGQ3SFJyamdDcDhDbkl0RHhWRGRBS3RKbTJadzBIV3hpdW95Qmow?=
 =?utf-8?B?WUVzRkg4bVIvVFRnWEVmRHBnOE8rYjRCUTFSbTRScjNkM05EOUl6YlpOZXRk?=
 =?utf-8?B?eVpHYU5RR2VpRmJvNnVMYW9oKy9WZFJNUzA5T3VwK0Vhd0taa3NrbTZValYz?=
 =?utf-8?B?WW95NUVRU2JMRHE5NTlCY1B1Rm5MckFCcDNrcUV1ZmJSZ3JDeXFlby9QWkNN?=
 =?utf-8?B?OUVjc0JrdXV1VE0rNmQ4bjRtY25OdHkraXBQNmt3RkY0clo4NUoxSU1iSjRn?=
 =?utf-8?B?ejZEUVVVS3p3aUZkTVJzbElvbFlhcHh4WDh6RWxEWExiMEM2RmxGbDFCM2d3?=
 =?utf-8?B?aVZaL1JWajIzT1hUYUcwNTZFU0pxZkJ2OWJFeHUxZ3hLK0RPaC96WFJFbTRQ?=
 =?utf-8?B?WGdQZmpSaGErNnJ2ZXZEQlRoSnBQWGZPNGgzUzlCeUpSMFA5aVE2UDNCRWVi?=
 =?utf-8?B?QUs0ZGlnU2YwVGVIdmtrVEVEUGJONWFUd1dMMnc5NG16N1dRcTQzVTAxbUto?=
 =?utf-8?B?Z3FEVktEbWxGRGxJUGFTN2xoNTh1UkROckhqUkVOS2NwWm5Wb3BaaDljUGRt?=
 =?utf-8?B?NkFkaUlkT0N0WFFzQUo2MUt2OEJubU9DMXZqWG5WcER3U2ZIem1aN21pVVZF?=
 =?utf-8?B?V3NZNStMYUowdXVqQUprR2tOSnFwdXUxNFNOT0ZtbjlodlhVdVJBV09IYUxU?=
 =?utf-8?B?bXg3cTJEK1pQa2VXUUxNcWEwc2MzSHc0dHJVbm5GNjVUaW8xQS9SRmR6ZS8z?=
 =?utf-8?B?aDE3NU1BdnZkbGo0TW1PbkdqeVNGWnRFWFlySHF1Nkk3TlNjMW5qblRxZ3A4?=
 =?utf-8?B?dGxuQm9sb0Rzam9pVGVzSFJrby9KSTZXTVYzT00zMzgvTEtseXBxZmEydzdj?=
 =?utf-8?B?bTZEUE1WOE9HVmw1T0VsblNzcHd4ZFlGeHo3Q1RSeVNzMGJjOW9NWVlNSFpJ?=
 =?utf-8?B?L1EybVF5eTErYmlhNUdlaDhqS25xNU00L0JIeWpEbWVTeFp0UDQxNGVkekNR?=
 =?utf-8?B?M3RsU2xBamxHdjZack1SSE1OOXlKUzNuTi9NaFJMbitzS1J0U2FqRjRUL0lp?=
 =?utf-8?B?STFBNDBrSXlHa3RmK1BXc1RORUM4ZWhjWTRMV0VxOXlMbHVUQldEMXd5TGRj?=
 =?utf-8?B?SCs1T2lQdFVJT1RNcnJDVlpaMjdNdm1VOUpmNWl6K051dGhHRUNQK3ZTN3NE?=
 =?utf-8?B?V3M1MFNOb3RqRW45Nk9ySTNIMHJjVVRZZUpnUk5ZblFNRjZobmNoSUhaOHBy?=
 =?utf-8?B?QW9YN0NJR3RORkt2dnQzeHMrQWcxT3p0WTFtcFRBSWM2QkVlbXYzL3dDZ0Rt?=
 =?utf-8?B?RkorVGFkSG9oQTZkd2l0ZTd6U0ExVkVVbS9SZnJaK0VKYm1yUi9wNXBNZ1FN?=
 =?utf-8?B?bGI2bzNIUXpVeHFNZUZnaU5GTWRhdzVJdW96U3dWbGRtWGQwc0dBWWR5dEND?=
 =?utf-8?B?TVRNaTZ4SUp4T3laejNIUVNpT3RoNFF5dE1wMk1sSnNoZVpGMnd0T040cmJv?=
 =?utf-8?B?YkY4dDluY3pKUnhQYjBUNkdVMmNNbzZHMTY0aW00SDA0V04wZXB3ZEZTUEkw?=
 =?utf-8?B?TVNzSDRRYVYrRGNuYWpoekpaWHQzalFkcGY1R3JvNFVEcEhNdzZMTm1PaUFE?=
 =?utf-8?B?blB1YksxT093N25waFd4OHhEMDMxTUdvNjUvbUloYksydEJFR3JKZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a3a15a-52bb-43ea-be93-08df11d6adc4
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 20:36:24.6833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1Y7183s+bKzBdoAV3qLjsKz+GcI4wLG4wRHtxPVt1+om0woWpiR60zKQW0ZbEu4x5k3mpprvFX15c7SeUJjXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB8532

On Sun Sep 13, 2026 at 8:54 PM BST, John Hubbard wrote:
> In order to boot the GSP, nova-core loads the GSP firmware image into
> system memory, and the GPU copies it into the framebuffer, the GPU's own
> memory. The GPU finds the GSP firmware image's pages via "radix3", a
> three-level page table of 4 KiB pages that the driver builds. Today the
> table exists as fields within the GSP firmware wrapper, which is fine
> because there is only one radix3 consumer.
>
> The upcoming r000 series[1], however, introduces a second radix3 caller:
> the ucodes firmware image. That is because the GSP has been changed, so
> that it automatically fetches the subset of ucodes that it requires,
> thus reducing the size of the GSP image. This is a helpful change for
> the firmware situation overall, but it will require nova-core to load
> and provide ucodes, in much the same way that it was loading and
> providing the GSP firmware image.
>
> Therefore, split out radix3 into its own module.

I find the name itself confusing if I don't read the docs. The radix in "ra=
dix3"
is actually 512 (given 4 KiB page and 64-bit entry) and definitely not 3.

Perhaps name this "radixlv3" or something similar instead? Or perhaps call =
it
GspPageTable?

Best,
Gary

>
> [1] https://lore.kernel.org/all/20260822015448.238214-1-jhubbard@nvidia.c=
om/
>
> Assisted-by: LLM
> Reviewed-by: Timur Tabi <ttabi@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

