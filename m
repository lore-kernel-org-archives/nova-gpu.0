Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013033.outbound.protection.outlook.com [40.93.196.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E01D3603DF
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 14:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668019; cv=fail; b=rId3MCV1SzPCXo7O06A0RWyfRtE7nPKWVmGzaIu9fSrbUZSU1+aTUYewmV7AnTs5GRpo+56qOIiZM/VgKrp2MdHPcSLOqFDCvSGDT1dOLvL24my/4o2sY3uFJ7WW46072Rva0jDGPaWPWgRHdr4HpMu1Hjnn1WD6aWLjFb73LLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668019; c=relaxed/simple;
	bh=r6YuS0gHgsiWvJkO3bVnruwfCb7u+baoBXEFXT4K6ME=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=oT/rbh9rlaUkN7cPTAX0XS2qpY+RvwgAmT902cv3v485D1DmjvYzy5sGAF/I3ixqqPznhd+REzL2smlfqkiMi3RFRpL11ajTscNZWueCmpt3Ip5CVuPDjvieGVRgtzwXYji/8mmoTYyqMTwHogn+Q37t5WaHaDXjX688GzwBBjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I5l+EpB9; arc=fail smtp.client-ip=40.93.196.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I5l+EpB9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZ1xNJz/qqq0HpwYjVpg0klSDYkAgIzOWp5DN41nNaEyQPMZfZpsJwH7TTSrJ9wAEqrN1v/+ECV2rAFrN0aAxg9V2MUZ5oaouQ9lBdc3c4F8//Te7NQVDXaZOlsqPy2CovuW4VcheAJRcp8mntxC7FNn5rUOzxizwVMzt3b8js3/BWu7I6yK+nAyifX4HWDkJCJvDWhGMRvuhjirCFusrDyCHl3D1BvLJJO1M8VKArGzGu0JorDxY7oG1iMTHdHasPK5QlPlMLA7hzlWCxiKpz2Ku9MS+MP2VKX6E6NUtI7uSCJORIkdFWslbfQAs6pupfaaDiN7XWlNQpi78HGw9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7ah4OWT/ZGN2GKXd2XhtQWVapqoTl+XttFuVk3p/ag=;
 b=C3gBlUK2oFEdTVAeEARpOoxeOTR2omw4JeepmYTWArp+m2YL6SBeIEyPqEm+ysAsGqjDpQMAmw0Msdlh6BPhf9Hh9gkM0HMqlw0JapLWFFpofpn2FD28HkD75DW9lwNf9oVzW9MBVFr1WVmIVAEUvaeIQaGuAY/nuxUUdGnvFGImr54E3GvWaL4XKlHEzeWpGQmgjZ34o9x50AWZzdthRsSjbvQ0hhkPbTNtlSsK2Za4/siRJ+8fe6BfzENzvqgRHf55LINe2DSNYaS2Jqy9h33vyC+Dz433v85bJ6L/ow9b7tf+EXO2hOIox79pKhsSIIW7haIrfr4eYJLOi5/G4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7ah4OWT/ZGN2GKXd2XhtQWVapqoTl+XttFuVk3p/ag=;
 b=I5l+EpB9xDfluKt0nyiUQ4zrV1qxRXuh6ZRLmvIwxGtfTdrZ9WUuuJZ8Lcund50vQA9kmRBEI3tYQH/9HP0zz4HCMnE49sSpRvzAxEncJeu+UnniJDZYAxgZOgQ0PdJ/+Bq7/H9PgNFv9nk9rWFpVIkIBlWu8xJggbsbcMxE18qQuD6nmrCcc1ohy8mKTHJK+kdAPb7ShNQQGQtgkoOI7Bl/icHDUPWqF3C6Uvu9OJEOfNa1gCfhs90kpSCwJbo+I70DYx6wpqRKeAMM376zeKFuF4bKxbeubFAr9uXT/M+3UNXkrs8XICHSu1lTdAb6+cB+wrLiUwaZxbePxjSqsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by MN0PR12MB6271.namprd12.prod.outlook.com (2603:10b6:208:3c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 14:26:53 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0315.014; Tue, 25 Aug 2026
 14:26:53 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 23:26:50 +0900
Message-Id: <DKY3F6MT327X.2BYD1IDZP8F81@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH 1/2] rust: num: casts: replace const type narrowing
 methods with a macro
Content-Transfer-Encoding: quoted-printable
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
 <20260825-const_as-v1-1-1ce712225fe2@nvidia.com>
 <CANiq72mYW0wQGzWRBvGqnatjysi4BnXBFLUpLPvrS0Q=JB2A0w@mail.gmail.com>
 <DKY0C2ABKO0S.1DWFMCOBI7A25@garyguo.net>
In-Reply-To: <DKY0C2ABKO0S.1DWFMCOBI7A25@garyguo.net>
X-ClientProxiedBy: TYCP286CA0256.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::14) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|MN0PR12MB6271:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aed24dd-e3f0-4d17-1ba5-08df02b4e8ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|1800799024|376014|7416014|6133799003|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kxKeOx5gLBAaeNjc9UzW3GPeKRaBrj1wxxp7bPlFRGjbYtaiyE5svmk+mEf6irdPtmFj6SI9/i+whleYpVgPF5O7oOl1wQ/CCZG9JNqNGYDV60b5cZzq13g5EcVMQMpXUSz2dpp6/Bc4dZTwiXnHNYH44n1DBlGu24oHbjTPhsF355IYgDhH+cGBVDUAqf+JEZvL2cHo6MBd16RdfQaYmtbhHx5BEbm5fUbWOA32CfFc2SsxjDmCOi9Ek3GvOVsyPDKw/wbMfP6fBcfR0YJFid/e3EpBg7FNgT78/Dd6eWVhw3jBjqxuYTo+tVo3lrgk1aOhTIl8d70HneTRJvgGzYLxsvAmdTVszB1UAO0ZMITYS4FeEvaqjs3F6kZtn+c1IXuGYxyzo+DYTpZ6JEYx5u4cg4ExJJyic6ZmS9ubL+tU3Fsiwcsz5qTc+ETTYvnITXeRE2VAZXvHdur53ShoWBNlasa6sxO4GbS1t6qwUHl42gJwf7vrYp5t/LKtVeUvQuGO/lhqNctKjZWVajPmBjNUkvXxOPDH7Y3bhhVnu9RGwkSCkNn1lOr7WU0xnuTI/Vz07WHYXT2VkV1ENQ4sy1iZRMJYJjVxfKcdNYCrPstOuoLzYKwzXFoQdiw5N+6UvW6VsKVF/jGyzKfQcX7Srar5ARdmN+thK61IAk4fOAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(1800799024)(376014)(7416014)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXdVemIybHRtWjZzZ2xOVW1RYTQ0WkJRb3JBWHNzV09LWnlSWjlFL1E5c3V5?=
 =?utf-8?B?OUFNb1VYNExhYnpiTXRBNk96M1ZXNUg5T004RUJEVlVoOXcwUWZLVGlwTXB3?=
 =?utf-8?B?VHM5bzBoK2k1RnYrSDk1WDhkQVJ4dnhReVUzTUZjQ2JJdmZqZ2NFbExKOVI3?=
 =?utf-8?B?L3BpS3IwZmcwaCt0NmpiQUs3QitEalNNSEpIdFRtTmJ6SHE0ajVQeUVRN1Ez?=
 =?utf-8?B?dkYwVVZjL1pjZmRUcDFRUzdvWTNzUkNLUVJxM09sN0NzZC9LZlZVYXVYNWlY?=
 =?utf-8?B?a3JtL2lwd2xTaGt5YnhZVEo5L3k2SVVqS0JJUnVIYWJVZkJ5bEMyeVR4Vldo?=
 =?utf-8?B?eEJsSmhCUWJkanBvbmZ4Skt2eEJCdXUyL095VHk4eEJ3azlaU2h6ektHaWgx?=
 =?utf-8?B?MUZUeVFsbFRKODRrQ1F4RmUwR3BTMnZreFJWelA4MG5yV0VFeXRUWjJMVUt0?=
 =?utf-8?B?Q0ppUUlwdlhWYWcyUXlSYzF1R2tJVXBwVVhoZTJYYTBCUW4wdEh4V1B0UmlG?=
 =?utf-8?B?cytOU1A2NmN6a1pVRU10VGFaYlpLcWhNVzQ3bXRlYkhubE1QZTBlZGJKaXVT?=
 =?utf-8?B?NWo2RmJVb3FXbXR4TE1yOXFOeGFMVlZUNlYyamNDU3E4ZU4raTMrMjVOTEZl?=
 =?utf-8?B?ZWhCMEtkRkJESDNlZEcwbG12eHpESXZGZWNJNmpnOG1TbWNUSDM3SjRxWWdB?=
 =?utf-8?B?OW5UVzBjcmNsak1KN212UXlOclltTU94VzdBbzhhamdnWEhHWDFNQ3dNTmh4?=
 =?utf-8?B?dEYzNjZFWlpBMU1BRm9YVVdjamhkNGVzVWdEWGhIRHJ6S2ltQXZQWmNkNm5S?=
 =?utf-8?B?azErQmoxM1dJMGZ5b3VnaGpkVmhZQXJ3aTE0dk5HaWxQd0JkOUJzRFovYUVa?=
 =?utf-8?B?Z3VlV1g2K3pnMTFwWm9adkJnZk5xYXlyamJGOVZTNlZic0FRK1hHbnQ0c1kv?=
 =?utf-8?B?bWxtdkk1UDVjNU9JakY3T0lXY0pMMnlDTjdOejZHSTM2L29LNnR3VkZXRXFC?=
 =?utf-8?B?cFc4aGZ2UTRycDdhMVNXZWt4bEdTaEFQQ3BNaURudFloWmw3NzAwWXVjdERX?=
 =?utf-8?B?aUdaRllma0NsdkpRdm43eVAxdlpqQ3EwNHcxVDY3MWVhVkl1NUViNGw2bDda?=
 =?utf-8?B?WVQ5OTA2NWFyRlQyd3FRUE9yZEFpNUZDY2gxaHVaMWx1Qm1rSG81djltc2Jh?=
 =?utf-8?B?NkZjZFNhS3MySitlNWNrc3dHU3kvZi80UUt1TnJRTjliVUZ1ZGczRXYrYnFK?=
 =?utf-8?B?TFdpSC9Ia29UckQycWxhL3doM1VxUGgvQXhESGh4UFE2am41VkZLSXBGa2N1?=
 =?utf-8?B?Qk00Y1ZWUTQ1R08vZkhiVFdCZkNEQ0gyaitUMVFPRUpIQUNMb3FmNmZlV29X?=
 =?utf-8?B?L1lNSHdreDhNY2QyeTVVUnJQbUFQdkVYc1V6UUJjTWJVWFY4WjZSSFJ6NWxR?=
 =?utf-8?B?WVdjLzBCY3liVUVuZW9PeTRSb0ZTSDZob3lvbUJCSWx4MUZMWnJueFIwUmVm?=
 =?utf-8?B?MDVFV2hjNE5idGc1QmNCVERsdnR4L2tSQVdVVEFOeFpPLy9qano2QUcvVkZ2?=
 =?utf-8?B?NE5LcXZ6bWVBT0pCNkl3V0RndWNLREtYZ2hncENVeGlyakowNVM0czBWc2J3?=
 =?utf-8?B?Q2dpMndYV0NZWXNjZXdpQXcyNVZ4cGFxandzQUxPN2ZWVHlBcm43UkM1M0Ny?=
 =?utf-8?B?SWxNYWFnZmxmdC9wb0dKQTNWTHhHWnNndFdLOFczRUtEZUlQcW9EbEpTaTRK?=
 =?utf-8?B?VDdWb1J6RTU1cVErS2Q1NTVYZ3I2eWIybXdOUkVvTlFsL0p3QUR5cUZXOXRO?=
 =?utf-8?B?ay96RnZ5ZFpaakNkV21rSDlKVW5SN3ZxTVlYMFNtblV4ZGZSV3BTOXovdTZI?=
 =?utf-8?B?b0NuajVFQUFqeVE2UE9CU0kyd0t3djlMRDFXYXBrUEtJZE9WUVl0WWlyd2Y0?=
 =?utf-8?B?OEZnRHFidG9va25YbzBqc294bVo3UndtdUwraVhockxOb0VmTjIvSEY3WEJ1?=
 =?utf-8?B?NUhuY2V3Y1J1Qm15V2dvLytyd01OVmRSdks1b2FpTmRXOUxyY0swS1R0Mk9w?=
 =?utf-8?B?a0hCVEdHSms3d3BhQUh1cmJqY3Y0cTZZeks5V2NsY3hXSmNDK3pudTdVUzNY?=
 =?utf-8?B?c1M3THI4MzNTd3hBelExVXFDa0pzWWZQRUtFZ0VSYkp1eE10Qmx2NXZYM3Nq?=
 =?utf-8?B?d3Nrb1YxNFJrN05rUk9tYlhaRzRUN0s0NzdtOS9QRG1VZVN4aHIvdzBZZmRy?=
 =?utf-8?B?dGlUeHNyYlp5Nno3S2tYKzVPbHY3aTBOcFJjNy9rWnFHbFFsWituZHpwRjN6?=
 =?utf-8?B?b2o5NEZUOW9NdjkyVFNFR3JNOW1NQ29OT3lFMW9Eb20vN3VJcTFzM0JNMXQ0?=
 =?utf-8?Q?Shv27ShXH7M8iKKdN/F9fmIUHb8ARB1dDqv6+aNE7/fQO?=
X-MS-Exchange-AntiSpam-MessageData-1: mtLiLc+velcJlg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aed24dd-e3f0-4d17-1ba5-08df02b4e8ab
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 14:26:53.5007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqfA9atxPEendYrjdxonzzOCQE+psbBE5eJMYaR8BnFXVYhEWFsiUP0oMMLlC4h4u9sjc+y877WVoVbeW1Si2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6271

On Tue Aug 25, 2026 at 9:01 PM JST, Gary Guo wrote:
> On Tue Aug 25, 2026 at 9:25 AM BST, Miguel Ojeda wrote:
>> What I wouldn't want is a raw `as`, because the point of the saga we
>> started a long time ago is to introduce better tools that allow us to
>> get rid of the almighty `as` into weaker (i.e. safer) options, even if
>> some uses of `as` may be "obviously right".
>
> I think that is rather a linting issue, not something that warrants extra=
 code
> in kernel. We have been requesting some extra clippy features and I think=
 that
> is the correct way to go, not add a ton of methods and macros. Yes, it wa=
sn't
> moving on clippy end, but I could add a feature to klint instead?
>
> Do you think we still need all these extra function and macros if we
> can get clippy (or klint) to enforce CAST comments?
>
> I can imagine the following rules that would practically solve all the fo=
otgun
> of `as` numerical casts without having to use awkward syntax:
>
> * widening casts are allowed
> * narrowing casts is disallowed unless CAST comment exists, except where =
its
>   value is constant and truncation does not happen.

These rules classify casts by width, but the footguns really are about
which values are actually being converted.

In particular for value narrowing we still end up with CAST comments,
whose existence a lint can check, but not their correctness (for
instance, a bindgen-provided constant that changes in a breaking way).
`const_as!` lets us drop them altogether.
