Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E3281724
	for <nova-gpu@lists.linux.dev>; Sun, 23 Aug 2026 00:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787443738; cv=fail; b=Tpw3e9y81Z0cT1oiNbSDqWh1cFPlLTNFw+ld+WUCEHiC72tcVVDt1xrX4bZLk9YDen8X2RqOJNISQ0Sfd+bhEnvd2HeC+cxoiINnUYjdI9UHcGOYFORL65aUyhce6qsL0Q2++Lv/IA9JeFltoNyD5Kj7xzSyTSPOc/mUcRCyjvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787443738; c=relaxed/simple;
	bh=5eh+CmW7l/641zQ8/5zOQMVuopOc3f8Lbd6/zfzoXMY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Ylml+JD8YOWi9R6AbaW/MJuMGd0P0QmZS9j8m+CCy9k6eHNL5ooFJFdwU0KltzlEY9XCmXWdPwWLAsvReBnhdJABDuaqQJ0RQfHgcb+L331CeHamTWGIq3cMswRlbDxrhlk+vI+5phJz+g35gmkmxaSI1928s28kR6FOO49uFlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QNXaz0HZ; arc=fail smtp.client-ip=40.107.209.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QNXaz0HZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9KJZKulgFLwO4lRcoo77teNtowRe1rqcSeHxnuOP7Lfyr7ojWxG5WdW/YSW+4Enisjs2Iwt2BaezDEL1bZTXGfodhCYoad0+6HRost7hkBgfSyPLWKpCUSS95MS0EW1DUGZ/XT5v4is3zRW+eqntdIZRXgOVg/ryYZAMBGLWyxH9m4it57b6KK13TKWQV27RJQ2TGMrSiz7mGCOl+DCEauLK53AtfPI2ZvP/KsRduelH5S5AFPlOnkrfGrgwjV6bJtMgI5ScILzFiycnem5tf7Qe+95udYN0fO7PL0wrKYgp2JkJEHiWN92BcU4p3Shgyhm7kwV7KLs4uVEbb0J0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAduuGoHmTaaSSgmdX98fEX7txShYOTZJ6cNnHVGg2k=;
 b=hJfYle1RwNqXRLoCr5of7v4MAYgPJXJLYslTvZSaa0wytX62y/hIHfjU4QKvTpY27zjjVt80Ki4GKvg29ty8WqRrvi2wApk5asaGoyrjHm4h5jdG+xlsDJKHHKAjxMQUt78IlscbT30xiKssnO2omr6Ua8sNQfnJmDee6PowXMbUw4lDjtzsPcOkPlmUQS+S9pqEJW62AtH1ukIaoTWtvui+/JnhZdKfjrQki6CH2c0pHos11m3lUj+ddEWj8hnKjDXNWhf5pPAObVNnUt6+rYQ3oKuEuzBLQD0i8csiIHPqee2XGQUIP/Kpnd9NpliDnux3xvMC/Qb4oLHWG/7P4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAduuGoHmTaaSSgmdX98fEX7txShYOTZJ6cNnHVGg2k=;
 b=QNXaz0HZ/lZBRjMtN5gGktxB8cUAhn7eMV+RTwZdG+poTpYHlG7JRZQs/8yzHB4OaydRYSx0icx/nTGcF8Doyb7TuoGibVzbI1wH6CDJ6zzHNblKJaShbz6MjftdqxO1/O5+xNzRZbXuZFlV/CIkxOQV75gTbMSyigY+QQ9h+4GuDFAMyrztkYp3QH8m4fds4SpTUgzCl8Q2aMkncXwxW+tdHZOnNwloNwutjXh9w7EvralO5LE2fp5nb+xoYL6tP/xBfBdKWwZ+HJc2TnsZBj77ADmB9DRlH2PgVunuoT0S8lB3gn4onYud1nrx9msJDOWJgAGPDA15nqGVvg+ntA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6107.namprd12.prod.outlook.com (2603:10b6:930:28::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sun, 23 Aug
 2026 00:08:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0339.010; Sun, 23 Aug 2026
 00:08:52 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Aug 2026 09:08:42 +0900
Message-Id: <DKVVX264VFKR.347534AM9TW1T@nvidia.com>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 01/31] rust: pci: add domain_nr() accessor
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260822015448.238214-1-jhubbard@nvidia.com>
 <20260822015448.238214-2-jhubbard@nvidia.com>
 <CANiq72=Loa21e-pywymk+KcQ+8p8NuqYQc79XDKduQh6f8TnxQ@mail.gmail.com>
 <4a092657-eed7-45ae-a63f-3370c9f9a09b@nvidia.com>
In-Reply-To: <4a092657-eed7-45ae-a63f-3370c9f9a09b@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0147.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6107:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c91350-dfe5-434a-07f7-08df00aab6c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|366016|1800799024|376014|7416014|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	la4vZKDNskDspTIKihkcFo73+j2gdkDVWXHI7MOuEEWxnbjXPNcK4q9c63iRRlUStC+4kXdh6UDfJH/1FJVo6cW00kiEqcT0jq/64vZ3CeIhhw6mBruZ2EiiSw6x7jXvEdcnX16xmq0QD86O20Akue6qIFFD4isku4fhz/s+63ogRwbbFW1SWuDtQP+AxQy5KNgVcSmQkc2qXw0RdAuQ58EmNtU1IBiqGuwW2KyIl9opMF+lsU+gWmAg2MpheWbMA2IUydgaZ8hKG1rW57pKGedqyOhsYAibnFdBgSC2Dhk/3eZrG4JHc0MYeIX2zi+Aeo7+4j+t+lCxEyJDNTbWFAvGxYNz0lwgiMXH8Hvsp+/rQQajPa+2UrxuSwJEvRVZ5S44gVHdCtxnd6XFoGLDTvh5S4nkGS3HpDQnx9I49NpgM5RAexMHlZX3V1Q56hkYJgYSklMUWtyq8eOztbMG93IyVcfy2euUBIa11mW/1It1jM5KwH8HmX3dvcHIz9+IZ+PVXv6EhdVm2WEQ0y/F45yx9mFBo24VCPA2qz6XwpRynmav3DvQbZ2feE1b1UFVKPVvj134UUoue31iVRWtvLLCwYryc6+su1w2G+htFGemJfgOZTxwp46xUWhypaBcCbSSfMIC0WMXjMHWPF+I3Id2qFRlqXivbEpGTMiGdIo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(1800799024)(376014)(7416014)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDcyUTFJUnRObis0V2d4NFFYNWNNcmxOYklvK1BHdndHUEZQd2FNVW02Sk50?=
 =?utf-8?B?MHI3VTRCbWtnNTJIZFFDdGpTczNqbWo5aFlTNTV2Zmt5dHZQTERQWFJHSlR0?=
 =?utf-8?B?OWR4YkhDTllMQi9MUXpNMmJRQ3Z2MDVzQ2JOd0g5dy9rNmRjMFhiV0RyZ3c3?=
 =?utf-8?B?ZWIrRVBGTm02TSt2WjdnL0ZCUU5rR3Z4SSs3S1pHVHk0cUtEaFY3d2xvWUtG?=
 =?utf-8?B?ZzhCQWxCQVNqazlNOHhQQ0xHRk5veVU3TE9jMkVlR0w5b3FkeDJQY2R1YVBV?=
 =?utf-8?B?R3dKY1ZiN3ZldWVlZmF6UWxkUTM5dEJOdnFIbUpPSmRGRlpzeUtaa25hY1V5?=
 =?utf-8?B?RXk3UzBWd0trckkvNnZ0Zm9YaTZ2dU1ZWm9WOStlZWhpVE9Qd0ZDa2ExZE93?=
 =?utf-8?B?YzRLQzZrTzByM01mSWZkWFEwY0Ricmtma21WcGpTaXZ1a3ZhRjBxQ3NGeDdM?=
 =?utf-8?B?UU81WW9DR0ZicVlXdU9vRS9yanFEcCtWZjRidnMrRFBlV0hONGgrbmxsOWt0?=
 =?utf-8?B?M1I1U3krUnhmTnpwUHkvcUFzUTFtSE01SGZpMGdaQXJnMm0yaWcwaDdOMmJL?=
 =?utf-8?B?SlZpN1dtUWhoRzVTQ1BUNEgrWkNMQ2o2K25MdVBZYS9sRTFyVmppWC9lVHNK?=
 =?utf-8?B?dEVwR05sS09zNDNGdm53bHpwdUNDMlRjUmhNcXR6VlEwR3lFNThhZjcwL2l4?=
 =?utf-8?B?ZlBvU0pWU2U4VnA5OWlUendXMmRoSUJKeHU3VExIRGFMY1ZVY200R2hyUHk0?=
 =?utf-8?B?OGFIa0RMRGVMTEsvdjFQUGFkeWQ4cTJYWENMQ0ZRTU81TWVZWU02bThjb3R3?=
 =?utf-8?B?Q2VvWG1oL2NkbDY1alR2eXh2R2taL290UWNjTkpFVC91dnozb241WFlJUDlD?=
 =?utf-8?B?QzdFVFFTM1JlOWhROG9tU0lOSzNSSXBUQmQ0Uldpc1h5ZEtlRlRySjFCeEhY?=
 =?utf-8?B?R1I3RStjTnN6Qzk0ZC8xVFZoMEpWdHFISkZHdHRySjZhQ1AxelVRaGpiWGhz?=
 =?utf-8?B?SlYzWlZnR2NpQzdZV2tZbkY4anh0RklTeDc2NkdNb3ZoNEpYL3FvbllXNHNh?=
 =?utf-8?B?Y0h0dXJhOFV1MGdXemhTRzdmeUx4cFVFZFZCYmpZcVV1ZXppelZWWUd5SkEy?=
 =?utf-8?B?NExtVDNieVRsSUlCWXlFT1p2RDhQeUF0a1JVcUdWb2k0SXl5anFlYU5YT1Zl?=
 =?utf-8?B?Y3VuUURGMkJoUEdncmU2cUdpRmRPVzBqUm9yRUhTbUgvU0RtZEU5UUIyQ0NV?=
 =?utf-8?B?STh0eXVnOHhCOUZqSXNZNFNQbFg5OUs5Rm5ON3MxRVpFRDA0SGRIc0M2MUFo?=
 =?utf-8?B?SVAvbWk5VkNnQ3hrUm1GZk50bFFCNWlNNnhIR2RYOG1WVDZ6bXlGNmE4c1NB?=
 =?utf-8?B?VUxvOXZqd3A1ZDhzR3VNRmc4c0hDT2tlZGR4dklMMnA5SVcrMmc3SnNCWkli?=
 =?utf-8?B?Rmt0eEl5T0laTkNUbldzV0dXYzNOZ3Vva0gyOG96TmtqYzhzQjZpdmFOOGYx?=
 =?utf-8?B?c3JlclhrSDNNczlOdGEvWXdiQjNpd09WcWlsYTlvNGovZFU2MHAvVmVTZU8w?=
 =?utf-8?B?SktzQ1hpWDRadHRkNkZyaEZ4dnp6TVZvUFZvK3E2Rkx5a3E0M3RYcnY3YTln?=
 =?utf-8?B?YWlUQVFwTDVzSTJRVml4aExWOFZUc1V4MkZweGMvL05INmNFTnlDRlJuUlVl?=
 =?utf-8?B?QjY5WS9SV3FSeHN2REJaNklUbnZUaWVwUlYvejR5dVJkMlBPZ2UrTDlmZldn?=
 =?utf-8?B?dHFrY1FkREhpcGg5WGwrcXN1VmtBYlJvS0pzMmxScDNZNkV3VUVycHQrcjZC?=
 =?utf-8?B?RHQydU5mZ0lJcUFtQlcyOEZ4eG5wa0xWOFpxTWtHQVJSL0Jid0RQT2lyVUNV?=
 =?utf-8?B?SE9pVDg4TUVBOEVoc3doRENmV3FJOW00bTB6OTlOVGhFcW8vWHdVOFNqeHN2?=
 =?utf-8?B?ZzBEVCtPRnovNFN4UEM2S0ZHQ1ViN2JNemV0eVBhellQWkdnUlZXeFRGSmNj?=
 =?utf-8?B?V1VZcEhtNnJTbEZlRjN4REIzNHVhS3VXcTVUKy92OXV0OWQrK0ZtZDZsM1Ez?=
 =?utf-8?B?MkxPTkx4WWhwMDFoeENmeWMvNnZpdy9YSHRHbU9ac2FDTWFzY2ZTNi83c00r?=
 =?utf-8?B?ZEIrOWlsM0xlOFJPa2xuUUtSMlN3ZVYyb2VmYUxCSVk2QjRLMWRucVJod1c5?=
 =?utf-8?B?VW0vY2xvWllnQ1F0WFFjTFEwVmxIMlp3S3VaL0d2NTkzWTh4VEV6ZVIvOXkv?=
 =?utf-8?B?KzFqMFdOWitGZk53dVJ4U2FEOXBSQkxvZEx2VWtQRUZiZjdhZFd0eVdubDYv?=
 =?utf-8?B?YnZnMWlLYzJiTWRGUnJvanNKdnF4VlBxc2I3VW11Yk5iU3RnZFhVVlY0UzJu?=
 =?utf-8?Q?KZ8/plhoanwQ/NL4ZQoBKqBDq4MoHFteX92enri3Qjlkd?=
X-MS-Exchange-AntiSpam-MessageData-1: JjJ3uK1W0gFpKw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c91350-dfe5-434a-07f7-08df00aab6c7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 00:08:52.3784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqUtulcwf6Z8fH7qCUTFJhaTWMGnF8LCcyhctqOFfOvf1/NToYV9yozpshZ70uzF/BiRjQgz6lVhYLGsGn80eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6107

On Sun Aug 23, 2026 at 5:11 AM JST, John Hubbard wrote:
> On 8/22/26 12:57 AM, Miguel Ojeda wrote:
>> On Sat, Aug 22, 2026 at 3:55=E2=80=AFAM John Hubbard <jhubbard@nvidia.co=
m> wrote:
>>>
>>> +        // CAST: The C function returns `int`, but a PCI domain number=
 is always
>>> +        // non-negative, so this cast will not lose any information.
>>> +        domain_nr as u32
>>=20
>> What about
>>=20
>>      debug_assert!(domain_nr >=3D 0);
>>=20
>> ?
>
> Yes, good idea. That's appropriate because the PCI core on the C side
> provides a positive domain number, and the Rust side can assert that
> that continues to be true.
>
> I'll add it right after the "let domain_nr..." statement, when I send
> the next version.
>
> (Although I would like to figure out some way to get this in ahead of
> things, one way or another.)

Since this is a very similar case I thought that maybe we can fix the C
API to return an unsigned like we did in [1], but things appear to be a
bit more intricate here and a negative number is (temporarily) stored at
least once (`PCI_DOMAIN_NR_NOT_SET`).

So indeed `debug_assert` sounds like the right call (and maybe we should
have one in [2] as well)

[1] https://patch.msgid.link/20260722073913.1807677-2-zhiw@nvidia.com
[2] https://patch.msgid.link/20260722073913.1807677-3-zhiw@nvidia.com
