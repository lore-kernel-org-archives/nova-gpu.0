Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022133.outbound.protection.outlook.com [52.101.96.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6BF3D6486
	for <nova-gpu@lists.linux.dev>; Fri, 12 Jun 2026 12:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781266021; cv=fail; b=D86TzBTlHXe6bvbZrR/Hbr/fbS2yoZfW9DVJiYsLqf8ex/10XCfqUEvvbmzxAHMMhgl2jR0fb2lYDn22yHYck6prtG9sslmu6S2SMh7Cc+gMBkKxN2ciVEk6ClH9kX6kpHh/holY9USFMldzTyYqa+MuHgk+VzZfqRWzfZrI7uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781266021; c=relaxed/simple;
	bh=tj019LCGqQVGKoflbXlr05Os0aiuSnleu8YxM3vRvSg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=K6FLXax599Ugj0Krpm+r9Uj+9CgMwaY0Ke4wPOvW9xzO5zbtts1W0N75a4yr+b6I1Q7j7DfqD+K76HbEZkBm/qsQdNaSIDZUAUjFI4oZWZjbJ8Y36uTeYw5vQ4F0dwgDFd6rj9C/MBrIeJGO+OBaDf9M2+ZgXMQYcxAwuSoI9BU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=IvfpluOe; arc=fail smtp.client-ip=52.101.96.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="IvfpluOe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUCsUnjkUjJ+KLXm+MIuuOBOj65g93ZByNG3sQ7Np6V7mKkn+mQHlfskJCi3+aFFmLxQOpCgv/DDLtmXcQultxetVOzAskqYC6PO/jcNvnxLYSJyU2XzW73a52bhdNiSyRQ4Wbmu0dOmGVvrdteA+W+DVcHV6Pkyt+e0b9GrfyEsyEQeGTL2cAhbkzurHFXL/gsqnnX0LR7ush72a92ZhGMi06MGZ7gTEqKksl96Vj+at8bMDMJftMybPtz6RkEofZQyIar9nPZDH0wHBL9UjK4QsluIywSaqRYDtcUAeI0aNn74Rb6+EpAxXRu8HkpTAW/Ruv7OOq0yaZ6CyaKfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mjwpmpqezdw3ZwRt5gdUILx4Gf7z1H91Llb3likxFic=;
 b=BtgsEYB72Zv3Yi1IL2jsYjZsz66sSsbcr8AHEpC8sxzEdYTn3Afqds9YqTwbGw8fqajKaKoEhJSi/ytyHOpXsT0Lex+ILBcQXrhXvrauMdpSLnmTKoQ+FAez5OUdsCfm/6fgENp4agPsqIlSKEysGqCUq+cPawQt4xYDn11VLxLgaq+C+YFw/0Wf2vEBv2+T4k/SjHXarkyd/17WKgNzpELoKwuMqFEClwq3yuvy4h9gyrqu3+GqqozwynPUIF3pFTaSLhUEiBFqFh/SOCM1nrCN+uwHvgiirOGFO6wQOJ9HMvL0Lajp19+RIXwyjNZRe5GY2aJ7NQ4tgFcGhU17Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mjwpmpqezdw3ZwRt5gdUILx4Gf7z1H91Llb3likxFic=;
 b=IvfpluOejENr579tdDCpkDfRbhyxQeJfIHIzJHjRqWS2REWMLd5k2Y71NmJWLA4dO01m9AFmn/sAe3ie7eFi3ZTxAE/WdvREsCyEoSPFHHboxihG6S03MyZZuT5iHmwEyGzpW6DgDddnYcjzIZ23xUJSaniDZ9uvH3lSAfXoQ2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by CW1P265MB7423.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:217::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:06:52 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0113.011; Fri, 12 Jun 2026
 12:06:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 13:06:51 +0100
Message-Id: <DJ723OXGM3QC.2YNSLXNPCLKC9@garyguo.net>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank Sharma"
 <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: clarify FSP ordering in the chipset
 table
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260612040420.121499-1-jhubbard@nvidia.com>
In-Reply-To: <20260612040420.121499-1-jhubbard@nvidia.com>
X-ClientProxiedBy: LO2P265CA0516.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::23) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|CW1P265MB7423:EE_
X-MS-Office365-Filtering-Correlation-Id: 391f966f-2b38-49d2-9ea3-08dec87b16e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|23010399003|7416014|376014|366016|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Qs0WjDNFGvGklSqMRgUOMp4tl9NYMNwerIWc3rpWJySNPwmIa3XL5wMyUnwxPYHEDEsP+/qFE+Yn0ykZZjI5oBkI7/YpMsy+27wzvPUGeGyb1PgiDG8p8C22/RnMsdt4pJG3Uu5FkxLdd+yiZ/qxRrYu0hGEjFGljlG+HiYPMReeVpziYUuJpYALo+EkxqGOCLwqtU2ZC1vzv/v69QWuKEsU4CYygboC7VOj++D7T5KMWhkxH67hyo+7JhrGQDbjroDvhNoXh3OHyZrH+/3PlTx0lTPB9fnV8YSsS7Qcu4JuFqMRNrrKguZgL7GIzghc/6DZFBh1Iu1E+SDnsnwN7yneYRGHfl309/0wA9wTQKd395c+g+Y9bBX2LIJ5qxhFMvWCelqkDULbDuhoAVLhfDRKiY3+NBSHaJEJShKDzGfevzDHOTWXlWhwxzBXdKeU6Acq7DZ2VYUv9sLGsvOuIyYhJXCuLJWS8XJDs596z155g0ep06M6JXphGCXMzGMn+h40PTIkRRMrSYLzcJazBfWpmRSru+s3PoSHnwDUSZ0RkrxeSU1c+XHMx5kR6sPZeRx1nYKCgJA717QourNwaNSKYZJ5sOoIex298MizlbYmjncgyWXCTn5vcE8syfk/0nR7ZNNvfLW76VNk/yxsUN4bKzQAcoEli6kmWb/oTQ/q1tXQ0s0GoKJdfQmYYzRw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(23010399003)(7416014)(376014)(366016)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkRNSCtsUWwzM3Vsek5qdjRNN21iOTN1eElpQ2kwKy92ZTI1ZzZrdGs2cEJI?=
 =?utf-8?B?bjdpSklJb2ZXUlVSbDlMVytHNW1qOG0rVGI0Vzh4M2toUTVHV1R5bGRkL0p1?=
 =?utf-8?B?cjlpd1pReTFJbTF5bmF2WVZCeTNHQ3FYZVZhc091d0w0TGdBU3I0Y0FreUdJ?=
 =?utf-8?B?Mzc4Ykh3YzZmNjZ4b0VJT0dieTFzaklGSUp6ZktHL2Rqd3c5cVNwS2pJQkpO?=
 =?utf-8?B?SEVsbWlSOUhueWJoL0NmdHZaejVsZlFWSjRjYkdDWlg5UlEvekhnZXM1Nml3?=
 =?utf-8?B?UVozQmt6TVc5YkN0SW9ZSFVBVHNDMUVBYWEvS0JxMXBPOUlGQTVHbExieFJE?=
 =?utf-8?B?T215NkppT3NHZnJmRnVYUzdBUWprY014ME5IQm42NlIyUkFqK1FqTVNZWG91?=
 =?utf-8?B?Vmo0OXpldXF5aVJ0T1lyVlZ6TnFnblhPVlliSWhyNTQzUXg0d1cxUm9adFFB?=
 =?utf-8?B?MzRyQlVPTE1Cdi9nS3JEVVo1WkJGenlqSERlWGxwdS9PN2VDMlhKVlpPbytx?=
 =?utf-8?B?N3BYYlNZODIzRE4yWTVob21uL2pwZ0lwRnFhVlZpbi9saTJCbVg0ZjQwZ3FI?=
 =?utf-8?B?Q2FuakxNRG9wMW01SDN0TkFDSUlrZlJmbTdwalEzdWF0R0xrMlFZa1dXK0xO?=
 =?utf-8?B?SngxR3hFWTJjL0ZTTmZBamI4OUhGWmZiUkMrREhCTWdqSTNZWGZyZjdMcVo2?=
 =?utf-8?B?T0xIeGFWbGh1QlFzL05JU1NPMlZMb2xyelp6c1pmUHltSjIvVHFDUEVzNGFJ?=
 =?utf-8?B?azBELzJNdVVJUWE5eUI5dDNXN2pJN0pzbXlYUEVvc1ZyV0E1ZFhyY1hqcVNV?=
 =?utf-8?B?UWpscWdMRDJHVjAyUnlEQjg1Mjh6T0RtZGpWRm9FSVpVWDlWMG5hZC9sSDZz?=
 =?utf-8?B?WkxCRU5IdUxXZkZRd2Z4b2JaNng1NkpmMVJ1c1VpbFcwaHFSdUM4MVdxWDJi?=
 =?utf-8?B?aVoxVHV6MEs1b3l2RFdnSURjY3c3L2syNzJVdFJpYkI5V1RLRnlQMjJQZlV6?=
 =?utf-8?B?ZHN3MXdQaWxvdUJnNHBvMnhLbFFxdmN3UXYvVUdnVE5iOFY3Vk9IUzV2RkFB?=
 =?utf-8?B?UFUrYUNyeXhFYXBhSnVXUXZjbmxKU0piVXBFbWVTNVJ3T2EyOTZzUkUrNzBo?=
 =?utf-8?B?U09ER0JpbUt0OVVIeEZSZHhVUDB0Rmp4UDJhWnBOWVppd3JWdi9WcXRxRFpj?=
 =?utf-8?B?SldkaXg0SlhVSTJ2eVhTeFdvOEFJOUhwTlg2d2oxTytNTVgya3lLSWRyMElM?=
 =?utf-8?B?eEF0c2dueTRTQzBLbHJvYUdlVGMvL21yRzhQVUZLSzc1MXEwWm5zN1NxOWZZ?=
 =?utf-8?B?ODZjLzVZYmlyNUpqYldTblovZ0VnQmczUW5GYWdiVGlWQ2JFL1k4bGtpTHE3?=
 =?utf-8?B?OGNEM1NrKzZrc1F0VUFkWHlxaGtjVlBKUzJHcmprTDJnK0hVTDZrNnRmaVZn?=
 =?utf-8?B?UkMzL0ZieTdEOEtvemRkU1JMZkN3SkhySi9YMmlyRHpiZ1FJcFlWMXczME0x?=
 =?utf-8?B?cnROaC9KenpDYjhOYmlnYisyRG8yS2EwRVdZWFA0c0t0czA0eEFGVUtqUUtw?=
 =?utf-8?B?dDJYQlJFQ1N0bXRNZEE0WlFCSk1HVVVEU0NuVWt2SjNTOVo1bUFvRGwzMWg3?=
 =?utf-8?B?YUNDK2cxVFFadE1uenIxeVNVSWxZRkh5bFl3TFVzRXpZYkRCeHhSeTBLbFh2?=
 =?utf-8?B?WFJUbk1EVXl6M0xkOHVMQ2JEZDAyRTdlOHRzbkxVbXd0b0NyUDBBc281R2wx?=
 =?utf-8?B?TTE3d1JBOGpQbmF5Z0h2RXNMWHZqM1k4dmJ6SVpVMHJUcnBlMGNpVkVpejVn?=
 =?utf-8?B?WlVkN2xhTzFSekdGalluYXZwa25CdUV3Ump2eGwwYUNQcGs2eS80Qmw4ek1R?=
 =?utf-8?B?Zzh6MzZZTStqdUszZFZwWjkxWE5wQkRFZkkrZlMvaWNkU3lmR1VEUmZpUGVs?=
 =?utf-8?B?eXpRMnFsSWxsc0tSWjhmRHVyV2N3UmwzUXZFcitZY1h2MStCYXFSYXVOclNo?=
 =?utf-8?B?WjlZelVNQllNZjM2L3V6eXdXbWJmR282MTh6bWdwTnNmME01TkZvZVRWL0sz?=
 =?utf-8?B?R1UvTXJpZ2k0b1lyQ1FjRGxOK092d3J4T2lSd1lXM2ZkemsrRkxCYVUzWmZj?=
 =?utf-8?B?WGxkNzdLNHFyRm1FN2g1aDc3ZnU0dnJFY08zRHFRbDFUQnhycEk3cHVkV2RR?=
 =?utf-8?B?bkJtWHpRWitKLzJYYitpTzN4cEtWR0Q5TWhTV2VJZmhxQWorc1AyZVcxbHA3?=
 =?utf-8?B?K2Jmb2l1dXJINHBKTGhzbUQyaERFVGZjNGsvNDJ0bS9LcWlVVnV3TVVsdklG?=
 =?utf-8?B?eUFCeFNsZnhLWU9neFc0SFBaczZsQ0NBUHNuQ2lSODYvWndnbHFQdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 391f966f-2b38-49d2-9ea3-08dec87b16e1
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:06:52.4749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXy3zI7Mc06EzhTd6xBhQqypkHbV3OtcErQaro9/ok3O0mZLn2LQXyjpph4quStbcyIY1c9TX0O7QkIbVKmxgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7423

On Fri Jun 12, 2026 at 5:04 AM BST, John Hubbard wrote:
> The Chipset enum lists GPUs in chip-ID order, but FSP capability does
> not follow that order. Hopper and Blackwell boot the GSP via FSP, while
> Ada, whose chip IDs fall numerically between Hopper and Blackwell, uses
> the older SEC2 booter path instead. Add a comment so the table ordering
> does not suggest that everything past Hopper uses FSP.
>
> Suggested-by: Timur Tabi <ttabi@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>
> Changes since v1 [1]:
>
> * Keep the existing "Hopper and later" wording in uses_fsp() rather than
>   changing it, and put the clarification entirely in the chipset table
>   comment (Timur Tabi).
>
> * Reword that comment to describe the Hopper/Ada chip-ID inversion and to
>   say "Hopper and later" excludes Ada and means Hopper, Blackwell, Rubin,
>   and everything after that, so it stays correct once Rubin is added
>   (Timur Tabi).
>
> [1] https://lore.kernel.org/all/20260610234128.547952-1-jhubbard@nvidia.c=
om/
>
>
>  drivers/gpu/nova-core/gpu.rs | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index b3c91731db45..20b59bb6b7d9 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -91,6 +91,10 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
>      GA104 =3D 0x174,
>      GA106 =3D 0x176,
>      GA107 =3D 0x177,
> +    // Chip IDs are in numerical order, which does not match FSP capabil=
ity. Hopper (GH100) has a
> +    // lower chip ID than Ada (AD10x), yet Hopper boots the GSP via FSP =
while Ada uses the older
> +    // SEC2 booter. We therefore consider Hopper to be after Ada, so "Ho=
pper and later" excludes
> +    // Ada and means Hopper, Blackwell, Rubin, and everything after that=
.

This would be inconsistent with the derived `PartialOrd` implementation?

If we consider Hopper to be after Ada, then we should be able to `assert!(G=
H100 > AD102);`

Best,
Gary

>      // Hopper
>      GH100 =3D 0x180,
>      // Ada
>
> base-commit: 550dc7536644db2d67c6f8cf525bba682fba08d9


