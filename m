Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012053.outbound.protection.outlook.com [40.107.200.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946353F7AA9
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 06:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790576684; cv=fail; b=UoNR3qGuq9hOYEWdEz85u8TToCpCpkuqRJW1kcP0P0BxjehExGr1q3DxVogEMzlNHz3FA52KeYNk4eP9oxLO9IJ26ohzirsU4nDI0aetakSkAQ8UCXnbIsZbAJfS329S3gr6g/+IAhrkFkCx39v+8U6r0CL0E9GmsxmpHIyE3Bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790576684; c=relaxed/simple;
	bh=TFywIqg56K6M2EynLuuUX/0XJj+dDDPsX+hiypskTcI=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=rFVJmZA/cLR+mpxwal7uxV2dSSLzwWkXnW6n4jPnOiQb+nBIUpQ5dchhiZmiZzaOftQBYftDN3DI2fsFUpvShBn4me5Dh+Hkww0tPvopXAEYJD0tCfpfI2TeznatnVn94cE/3HZDd0F2zxOy81NJQC6+ptfnzUZjzQJvwraemVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g+R+Wk6F; arc=fail smtp.client-ip=40.107.200.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g+R+Wk6F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdBfI07B7ZwKaUULbIE8mfLkrgcc7CRkD84aEZEHSeTV9JKSc2SBgMEbvatPeH+lCvUb4jC5ELoC98kDztk/DVj8LSiiSZVta21REaip35bhMk5+YAkZ4KfzIKXMwWPY4T0qViI9Lvy0ZvHc65czkbFAovM59RVuqK2LBGpicBQ8JxzWQ8Hr4WAo4XpktQA5FqW4JX8NPVy5Hs/4m6ZR2uRhslTtMkzVa5OpdMEL7snanqTi/kPRYGsNCvTmdfjhmq+h9b0sD/bq68C6UysoarAtJ5asBZAIm7/P7UbaPtE0dmX/6aR/vZryfaiDozOsKkl3QvLx94jHhM1fNCehPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFywIqg56K6M2EynLuuUX/0XJj+dDDPsX+hiypskTcI=;
 b=gCxKLV2RJ8YcNw6ZwlQCKSjZCjtCsJvcOAo7JjqEWV3WwGSip8d4A8G8Z0uJpzpQQ9+IBdzQXrsdHGhrakHiIQa3VG5UpvgXSSJIcPkvNHNqb1msfctnOxZRwBy8lfPbT0ouIFcW/eAK2kSuVnLdz00Po8Nn8/P3tyHgociYgXQnM16RaqtidlK/D+LpeqbFNVGiTofLblZW7eUM6k60ROmVo5GMSj7kyxdmIHJ72NZIAEsLfKstBLU33si4QqpQf0c9ttMnJLhAss/Fq9j+SOx8MpZK5wIFqoKnCojk6oYA2ET3MEYgeVu0jYPaFRmuXviHBvUK/H/gPb0Lr7SqAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFywIqg56K6M2EynLuuUX/0XJj+dDDPsX+hiypskTcI=;
 b=g+R+Wk6FcJ6zxTxO1lzdesgVCCtsJDlCTmw9giDmTd+ORJhLnl/z9xOkrT5/CU0DfgW5gaFqOTbjYLZN4EY/OKSXh1jRjq9nyyllyTSLsIo4QVxVM9GDiV9ozO4Vc9N7eolUvVuALv2TzawiaF4e8WhK9N8ALLgZK/J/Jwyuy1wHmImoGa0Y/XsdWt8vxlkhVVGpNrIx41IbuZfvgx/gUnolkys3wxEO1/4tVHE7jYKWA20vu+lbEa2loGM2ZMis1fxkqFhGsiJ4T2zJtioaMJDX1EdYcmSOhlHkbg54Ed4WFb6bNldwPhUg7hy2Mb+PkF2Ye513DpiipdeC1+mf2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20)
 by SJ0PR12MB6904.namprd12.prod.outlook.com (2603:10b6:a03:483::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 06:24:36 +0000
Received: from PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d]) by PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 06:24:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 15:24:33 +0900
Message-Id: <DLQQGFT90VEK.3AMVLNNRWJEXU@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/9] gpu: nova-core: gsp: cmdq: validate checksum
 earlier on receive
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260927-cmdq-rpc-v2-0-c3f66ae73be4@nvidia.com>
 <20260927-cmdq-rpc-v2-1-c3f66ae73be4@nvidia.com>
 <DLQNXKFGJHZ1.SGPZQQPQ6BT9@nvidia.com>
In-Reply-To: <DLQNXKFGJHZ1.SGPZQQPQ6BT9@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0136.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::6) To PH7PR12MB6858.namprd12.prod.outlook.com
 (2603:10b6:510:1b4::20)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6858:EE_|SJ0PR12MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 30314ff8-3816-485d-53dd-08df1d292ae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|10070799003|11062099010|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006|7136999003;
X-Microsoft-Antispam-Message-Info:
	0bKN6aBBRPcJdKA7rhgH3N5oOF2BwZtiZzJv8zs2qeiAU9DzGS1ob72G5P+01FSmr+Ad9Gd5m1iAuaoqEfVkxMEMZPopmLfJpf0kqUeUYNpM6IGMG7Pe5q16xzk6C93GUvfiJVVA89khFO03bYtVYH7nPKVOwSzBMPVFMWQLFwmCBrItIaTA3+DVgnew43B0jAAiBCCzUaBxreOndnv+qP37LwPWTKjRCifFH5BLDMOI6qh+HSASYw8KXwERGV4Chu/g2tcbf8DwA9pBO1YQdtOkRaioO6aF6PohCfbrm0szAIfjwlXEfJCCIzrH0+PXPqBFlAoI+Mc8W/RgLlCeEDYRJgxxkxh1F3izTnUEQvCV+zTemk4B/GYE+Ds6adJHz0a7xSHq8OZom6oyXL0JFiy+GUry5Wh6v/VQ+ev65P2m8MNQmUIytAHYdXf5sr0PGv3/R/A6q0UILzX6HWX4Y6RBgEkx/NvsgmwQX4ib9oV6Ithb+K0rr8D55ajFmeUeBIWY7cqIitWxdVv0MhRi3k2yCwldIvnVdAbFcfN2U4dp3683pFKJlyh0JOC55rwXGw4DxyNoX3vVD1SACTLxCzWTuZkavJNxzOowkjidcAGNtRkXX+M09vv7Rlz+ikRLBjq1uCxz/NAPqOr5Y6rUs2B2FE/Etl8/+jae8gwOB2A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6858.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(10070799003)(11062099010)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006)(7136999003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXRVWjQ1R0RVNVZoc3EzQ3BpUVJYZkVab1hDUXAyTk9ZOWFJR09WY3pXbFJ3?=
 =?utf-8?B?Y1VJdWFSZkRncEgzalloS3ZUT2tqd1o1WUtmeDFlRitwRjBHcW5wSXNvYmtq?=
 =?utf-8?B?ZHYreU51QVBPT0lJcGkrSDNKWUJIaFpJWkxZT0RFb1ZXVUJvUUxXNlRBQUlQ?=
 =?utf-8?B?VCtYNGpIdnVWcEZGTFR1WEIrbmdSRSsraGxpTHpCUnM4N2M3TUpZTzBkSS9Z?=
 =?utf-8?B?c2ZQbjR3TmlUZndjZHYxUjRtWnFLRTJtT2dMSHcvN0VFeGEyaEc5UXFuR3hJ?=
 =?utf-8?B?K0dCaVNJSE55aDhqQk5Rb1MzOTROSVJxOHZVY1hZRGNMNE5lb0hjT0RGMUo0?=
 =?utf-8?B?YU9kK0crc0pxM20vUTY5MjdIQ3dtVkRZUlEwdjh5ejlidHIvQXJEUmpkOGpt?=
 =?utf-8?B?UVBmcmhYYkczVWFwb2MzWVRWZE9QN2kyQTY0emNoNTFudGhXdXpIamFlQkpv?=
 =?utf-8?B?RWk4WTIwOTl5RG9ZSVdqQTVUTVNub3BqS0tLOTZPaHowSDY4N056T01xVjRU?=
 =?utf-8?B?cDZaZTlSVVlnbzlXZ2lYT0Y4UTBtK0p0bnRnTDRveXlxZWtWRFQ2WmhoanVF?=
 =?utf-8?B?L0tHVVp5WlpOdExCZmp6dzUwOUFVNXJqSmRKbkFzYjZBSGhkSHRJVEdRdEhr?=
 =?utf-8?B?Vlg4S1VXdFpiaDU2Q2trbVduVEx3QmlDOXlyQUVYWFNhRzV6MytxaFZSeUJF?=
 =?utf-8?B?aDJIam1QK0ZrZlNDTG9VOFdKVEdaNmFTUFU3V0VsaWVhTnI2YSsxVHhJdHVt?=
 =?utf-8?B?UnBsQ1A0dXNjYXVESDRQVkhLV3JqeG5sZDJJOGxRS09ueW5Md2dTVDVGQlZV?=
 =?utf-8?B?V1pPMzV6TGNBQzR2bjE2aU1zcVJtN0Radnh1YUFWMGF4Qkp4RWxlcEF4QStB?=
 =?utf-8?B?Y0FSYzNkcEFMWlAyOTY3K2x4MGVYcHEyU3RJZnBLYktDU2FjUm9xdkZuL1pF?=
 =?utf-8?B?OHJGbkc3WWJhYzloeU8vZkJUYVEvanlsREJ3bnJvN1h6SkU2c3R1M2wrMEZG?=
 =?utf-8?B?d29maVhwRGhNK1NVaU94N1E1a0d2K3k3NGU0aW9tNXZZNFZ3MU1oYWF5cStY?=
 =?utf-8?B?TGx0U2I3TmRtR3lKOWtSOU9OWitVN0Vic1pGV1FVbnVYU3JhQWxGMHFFdUxw?=
 =?utf-8?B?cUY0RXdWN2kyVmxwY3lrMjZtUEZGNlJHNEdJa1NGd0p2OHhvbGRrQlVzZXdo?=
 =?utf-8?B?WmloM2FVRkdINFYvU09LenY2bnpFa3E5VFdzZnAwbnIrWHo1SnVFNzFXc0g2?=
 =?utf-8?B?T2tYSXRjZitYR2ZKVlVZRXdESlJSc0UxWE5VNXRQTFdqLzdkZUdiUzdnT3Vt?=
 =?utf-8?B?TDhaVHRLSm9IVngvakNUOFFrOVJrZ2JpOWhJS0ltSExyMW00UkFrY2lzUUZw?=
 =?utf-8?B?T2NHRmprSnhCR1JYZnFEQW5QdlQ4djFrWnFvc0lPcWY3bE80UzV3eEN2SzJD?=
 =?utf-8?B?RWpmcWdWL1lQZTBXTC9SdFg0WUdoVzRsbHVzazlJZ0pkcDBSbGl6WEhvRFBy?=
 =?utf-8?B?ekhiVjdPS1BlU3JaVVdFZmxnRnVmbjUxK09KdFhmaGJQMSsrdjZBMnlEWjIw?=
 =?utf-8?B?UjNsYnRyRUFYMmVhWitkbEZpSHlaYzNHZFQxdHRWemRIOVQvV29kU2pwOHU5?=
 =?utf-8?B?TkRhQzF1RDNNNm90amZCWnBKeU9UNnoyRUlkRktSd0dMS1p6Si9qRFN6aXla?=
 =?utf-8?B?WVRxRUlFTTJqdzc2MEEzRjljQXYxNHpiWWRkS1FvSmFCdmhJMlJ0aTJzNGw1?=
 =?utf-8?B?VVNUb25HdjNXbGRsaW9iT09VM0E1OWNUcDBYTkRwRlA3dU1kUlE3MXRXcTdV?=
 =?utf-8?B?U0prZ3dyQlFCSUV2VTVBQ1o3TG5ncUUrY2RGakQ0U0hFT0MrV3JWSzV2YU43?=
 =?utf-8?B?WWo5T3ZNSGdMbXhmK3FpVFVIRlc3YkRHODQxVU5Nb0tMSXZwUzNkZTgyMjdZ?=
 =?utf-8?B?YzZVZU1ZVEFWTWw4N3IrbWljK01qYUJBNHJ3bEUyR1FQTGxRa09tVjYwT0VB?=
 =?utf-8?B?MTVndStTcHdYR242TmNUOUttdU4yZzVjNHMzdUNMbjZvUXpJSGRkczFlVmRZ?=
 =?utf-8?B?ZU15cmpBc0pESTVwd2dTa05BMnNjcmJYRC9CNHIvYzgwZFh5ZkMxT1d6Zm11?=
 =?utf-8?B?a2FYZnRXZkdFcVQvOXd6ejFhUjN4b2xzbkJVTlVFQWJpeW1XU0Y4dmpJbGEv?=
 =?utf-8?B?OHN0N01TUkZwOWJsa080Z09PdDdRTjlkdytBZGw5OWpLM0x2TlRUcVN4b1pG?=
 =?utf-8?B?WWYwSXJ2Z3grN2dEUHlCSkE5cHVUaXVtZ1hmU3RTYXZwZTlBS3pXRnp6VE9J?=
 =?utf-8?B?K1dYODRmY1QweWJTV3Vuem55aTlkOHl2QVpCaHdrWVliYm9iRlJaTGwvVGc5?=
 =?utf-8?Q?8MnF54XS34qrEu2qm+yKvgs8IYCnbGYlUNSIKJqnHu9L4?=
X-MS-Exchange-AntiSpam-MessageData-1: n/OT7tt89y60Xw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30314ff8-3816-485d-53dd-08df1d292ae1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6858.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 06:24:36.3604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OywCTHWzybM9xum8mcoySU5OlMxvT+k688k6uHD+j6FRgcxtfQeqkf8bv9nZTGp3x6dMAi1DN9DGIgQJ5qZ2Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6904

On Mon Sep 28, 2026 at 1:25 PM JST, Eliot Courtney wrote:
> On Sun Sep 27, 2026 at 10:46 PM JST, Alexandre Courbot wrote:
>> The checksum validation error message of `wait_for_msg` prints the
>> message's sequence number before validating the checksum.
>>
>> But the checksum is part of the transport layer, and it not validating
>> indicates a corruption that could very well be in the RPC message
>> header, meaning the value of this field cannot be trusted.
>>
>> Furthermore, the transport layer is not supposed to know the kind of
>> message it transports, and it accessing the RPC header is a layering
>> violation.
>>
>> Thus, move the checksum validation before we start looking at the
>> message header, and drop that information from the error message.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>
> N.B. this means that checking the length of the message (which uses the
> payload length) almost always gets replaced with a bad checksum error.
> But since we can't distinguish between corrupted data and something
> wrong with the lengths, we can't do anything about it anyway so lgtm.
> It also means we don't know which message had the bad checksum, but
> again I think this fine too.

Thankfully r000 gets rid of the checksum (which indeed is not very
critical when messages are sent through shared memory...), so that part
will eventually disappear. I just wanted to get the layering right to
make the split in the next patches easier.
