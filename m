Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013041.outbound.protection.outlook.com [40.93.201.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D5A23EA94
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 05:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787635659; cv=fail; b=jRs6cWPZ6VxjdVbV2gf2Act/nTttf5dZxO1ViYVYWbw8X7+ScXb0J65rATGOhsaIAHMApsOIDqqR5QLHpgB/JY4LN/WycDuqDNxBBqstMJBYVzNoyiAqTIXjVcPieR8PX8LCCesb5kqf9/WedF9l5hLa9BrP7oNrv8p1SNQCd0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787635659; c=relaxed/simple;
	bh=Ft1vJrrMvwlp2GJzMgDA+lw8v9ECZya5yjjA0mkeFCc=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=p7PGkV09iEwoqBPqomvq00LjlQyvhX0DovZacK/4W9PZESrLJSN9OnLVKNo68cFMUcN2mtM/Q205GyAweuSIviqXrhgKP63qsps9Wd/89An4tzTWi83/lsbRVeOXjmYbfF3GuAK1olKnULfplRX/J4yEYTyn/e12YC7zbqJxUXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GRrVS9J9; arc=fail smtp.client-ip=40.93.201.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GRrVS9J9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfJnlqf81Ce5RKKQCvxk8zkeL4QF1mUZvB+CNHWC3hjpeYf9fioBAjKddPprqHo7D5dRSha05R98hGqD41gsuj+38Y5JE/2Rf1XV5UY4VxLAq/XbH5LIjMa5/4KCptdSNTpzSZQTnwImuVcvDXIpsNXogq+lSAh2tEOmaAwT/jzvUxrRbp2Utr0fNjxf5TMyKe5WaBzIgGzfbrD2xOZdP04lxx2cockPcjJHo4e+hKwQ82dHRszbFhjoAklFcVGMkZnqowmF874xGWUD+mkWlpmdLS8mXuDfclYVEfaYp7N5LuizdO6SqRgT2ZabA9vapK4MV3ww1NVVP4fSiFw5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ft1vJrrMvwlp2GJzMgDA+lw8v9ECZya5yjjA0mkeFCc=;
 b=rYoUUv8ULb9+8XDtrGpp3nNE4m38BdsIoDlchtBtlyV/oA4NJvGEGkIc2nK4m869OUVCLysaNENBlGwisXq3g8LGia3hafYSFRr98++LEblJtufPZc3n4Gl+D5yFj4zxB4Ss/o7G62h0woiOOqMk9E+juBI/HluYzlP9n/kP//Zih6zvwVnOZ3V68vAKr7dNdj7fcfuxCC47PiQBhaM1kTH2FZjgVszGu5KlmFeh/PDPvbpKYWdng+Ek80KsOCgdv4De5LK6Jds0LRI1Qr+eOirL8g+5RF9CUyBcuNqPdxwmtiIMmHLB+S26uXFGkmW+X1jlq6DF9yLbm9yTF1v7Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ft1vJrrMvwlp2GJzMgDA+lw8v9ECZya5yjjA0mkeFCc=;
 b=GRrVS9J9ZeiM8B2nFhgs89Q2WW94MmttddcTWrx+jxbwh4mAZO8XS/yWol9VrxKVQ54JMQAD4bDQEnx7gA+fvEnDYe1EnoYFqRAi9AspLF+XZpPH68dnW8YqAdfbXZIftjlgUrXF5MpdSss0i1sw1Bm7OmmLMlO5sSsMVpOS2RRF2ovAZ9XxwPsMdinZP+oH5Ok3jpntaqmiL/0jbddqiBExynLcyhhJoQmm89xI1FkP4kebjlOaRdL1AMTbFcgXz8az/shzWXu+bYHLvPHMIPVfaCUnHHdsdfsxZEGPN7M19QVz5rSZW6plAe+kJDIsOy/TEuTTNTaRpfXOAWAJjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 MN0PR12MB5955.namprd12.prod.outlook.com (2603:10b6:208:37e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 05:27:33 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%6]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 05:27:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 14:27:29 +0900
Message-Id: <DKXRY82YPHIB.13IUNRJSOYH4B@nvidia.com>
Subject: Re: [PATCH 2/2] gpu: nova-core: use kernel lossless integer
 conversion module
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
 <20260825-const_as-v1-2-1ce712225fe2@nvidia.com>
In-Reply-To: <20260825-const_as-v1-2-1ce712225fe2@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0195.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::17) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|MN0PR12MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: a9ad16a1-fdd1-4049-916a-08df02699075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|23010399003|7416014|376014|921020|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	B5zhvXLfHeFiz3J0EGBBxEQGI/O68xTTGpvHH58cm7KL5+xpxc6XoXct2TWkVRON2BoTWdZxoU3t9guBSepbVresm0x/jx/k4ztXzDGqoLam/KLSmVhBAekDRQ0Lvb0dKOWk9XTJAQC98YNyjC0o74/rMhPRXl6Tqt+s1k3wtfcwr2/HQm6KoFfd0lvkiVAs83SGi+prlfCLs4d97WL/KOq8TumB19tTVpCdt0xyL4A1mb2dyGdAaJEqt9R/lDO2P3ifjXYUE4HOoorwx9joHhXuBKqEXhfdzEsNM3NsIx8vM9Zlux/ME1u6kQeKZtFBA+k7ec2flWedQ2C/i+FxXSzVRg8wfImL4LncnSTRNVWbSd2Twcd0kAYUXit20nm1GAgKqgzsTdbW5wrmtsBAKhm8iKE8Eev3Au4L3vX5X72VUtCMQ4cKMnAcfwAl5vdoZZGt11AZ2LODIJfx3gi0uewVojVBp00wauBunBbD3RhlbcCzywkzgYH1pMPCapRb44zHSIteD5vhes2LOVQntv8eYmWDrExujatvMYaxKt/lsy/U6VgD82y6Z+thTgYZfTzaNzqn27+hF3IwXSr3F3ON/kPrvP/CVzSSdcaSQ59Q7aQpvZ8qnYk4kfvnMBawlXMaVLGyR6wV/ojC7AbZCuCFwNQzTrnsqemUQjo3dIQSiP+jrAGEhR5Q6qKNz+Ain/JVJkHLaNO2sPYoxq8EBg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(23010399003)(7416014)(376014)(921020)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1I0eEZxVU1zWmRRVEpjeDUwOUpBVnd2Qm5YdVViVzYxZkw0a1p2Q2VxZytB?=
 =?utf-8?B?OStWL29aUGw1bTRKbVo5ZDFFUjRqNnA1bkt0ZWQvNE5PTk5KMlgyeWhJZ3JV?=
 =?utf-8?B?YkVLcFh4RXlCZXFsMzZNMkRSVklnYjlBamR0Tk5nc2Y3aUNUZmlpZlVzdVZv?=
 =?utf-8?B?a25qVU9EK2hWdU5ZWmVuRXhEQ0lmUE84VzlzVFIzcHNlK05YYUdJbGVCWTNV?=
 =?utf-8?B?bDVVNGxUVFJpTkowNVdhYXpNS3Y0MHFDcFlFb2VZaTNtZHZNSVNBR1YvRHVU?=
 =?utf-8?B?NThzQTd3UWRuR2FVbm1vRFFxRU42TTFWTDNiSWZwL2h0TUNIb0FKQlRyelNJ?=
 =?utf-8?B?OVFiTzUxbnNEc0syb0RjckJtVXV5bmlPNEIzM21qZk5yaDRGRkcyNitiSkw5?=
 =?utf-8?B?eThrKzZFaXhpVVExT05kS2pzSU1OaUZsaS9kYWdjQW93R0s3RHZtUFExbjVO?=
 =?utf-8?B?c01FWGNUN2VWTTlOUVVZclVaNm9xTytVeXhnWmVFZDVWQUhYQlRzajZWYjBB?=
 =?utf-8?B?VE0rbkZVYUUzN2xVYnl3aEREa1pCdWJ4c0x0RzdmRGpFQ29xcDQwUE1nQTlS?=
 =?utf-8?B?VHFvcXhRdS8rd3RaUjgxZmcxODVXWlVJMUJSSjY5a0J0Zks2MjlZcE1zS0Jj?=
 =?utf-8?B?WjlUSVd5dStOMzYzdGkyd3dzZVNPd05nQU01dDFqQXFNUlZ6VkpheXFOQlVh?=
 =?utf-8?B?dmsvWTZTWVNxeU1FV1YrOGxYaHIvUENpRW1scEtSN2ZTUkRMYTVidDAzWDRB?=
 =?utf-8?B?eUVMNE13c2IzMS90ZEhMcURlczJiNkVkUVJGZi9kdGhDV0piSDRBN3h3RW9V?=
 =?utf-8?B?dlpVOHI1SjBSV00yNlV4ZEg5UjBkOEZJUENsQjdiMzRjd05mOTRxaW5IRmdR?=
 =?utf-8?B?RGNtUjJxVjh5QzNaN25CUERLSGQ3N2YrVXdHYTNaQ21PNldld0p1cmhCWGhY?=
 =?utf-8?B?NlJscDNCR1c1a1M1anAybWxXRWx6bWxXTUdiaXo0blA4VnVwWDc2VXRJNkQx?=
 =?utf-8?B?SkltR1krOGxUU1oyVFZjVTFIaExFcXhEQmNxTHNlb2RHOUZqZ2RiaFEzaUxN?=
 =?utf-8?B?RmpPWU1tdmc4bFI0Qm9JNEhpN1Zya2lWU002eFhJY2lTTm9oZDdvTDB0Ri9y?=
 =?utf-8?B?UEZrNUtCa1BraVQ4WjZJN2tONy9abHFRbFRsbFY1QVkvamhKdDZUNVBJOTVK?=
 =?utf-8?B?cExwSTZ1ZzZWYTcwUDNHdWFWckNIQVRMU1NQMkxrTWNWTE12ZnNLRGtoZWhl?=
 =?utf-8?B?WkxYa1AyQVJYcDcvQmY3RCt3M2M4YjRma0V3dUxob0NpaDVpTUV2SFl0aFJn?=
 =?utf-8?B?ZW56a2ludW5JK0JZODVWUmRkNVZQaFJ5cFhHWVQ0ckxncWYvS0FQVE9WNkZ4?=
 =?utf-8?B?MXU4WjR5UWtseU5RcUZ0VHpjQUw1OUhYZEFvR1FsTHlUVzEzTFhGMUtONnQ4?=
 =?utf-8?B?NmVUeG4zY3lFcFQxSHk4Vy9udmN2R0lpVEhXcnF2Y2o5Rk1NaXk4RjlhL1hq?=
 =?utf-8?B?RVhCWVc1UWI2d3J1YzZSbUZJSmNSTE5RL3dxU1B3WkFYK0drVWdSODEzclI0?=
 =?utf-8?B?d2lMVGlUMWsvZ1dESFh2T1ZOaHdOZlFlSHA3ZUZnUzZIdVdpTkF5a1ZBeXFh?=
 =?utf-8?B?UWI4VnF1SXU2N0ZBdUs2U2JSS25UandDZUcxM0pVamVrbElCb0svTXdIZDM1?=
 =?utf-8?B?U0NpalZzNncyOGUzZm9iRGJQNFltTWZaNUxadUdHcDUrdVBycGd3eEZCUXY1?=
 =?utf-8?B?UkRjSXJCRzNsbStMODBFZzZsZVR5MWVMcXJvc0F2NW10dDY3eVJycVd0djJZ?=
 =?utf-8?B?ZGJVWDdybjZKdm16NlNqRkZacGlJQWlBVGxnbk4ySjJYajBpNjBQa2xFMWRz?=
 =?utf-8?B?VmZPMFlnWk8vTithendUbFdNcjlDcW52bS9DT3Y4b1k3WG9YNHdOb3dwVG9J?=
 =?utf-8?B?SzdKd3gxU0xoZUpoU1ZiSlhsOUtEN2NqOUw0Q09FZ2NxUHZLY2pRTXZvbnlJ?=
 =?utf-8?B?RkRnWDdXdWdQT0ptVnoxSitvSjlBc2NWODVWWmRZc1JnTDBLaXlEaHY1M09y?=
 =?utf-8?B?Mmx1dDZENzVkZ0ZCVFRva1Q3UU5HZ1BoZU43cUw1ZHMyNUVSQURQQUE0K2Rn?=
 =?utf-8?B?OFI3RDZpWVlqS1k5eHBocUJjREt4cDVxaEpobUxvYzg3RkU0RnFsQ0xCL1d4?=
 =?utf-8?B?NWVYMGZ1cDFGZGU4eXltRDYzcTRaR1Z3Vk9FdlFFbEhwTFZBZ3pxNVdnck1r?=
 =?utf-8?B?cGtBOFE4TXBWQmN4NWZUL1VMRnFGeHZQTkY1c1lEa1dhRTVpaDJmdmxDK0F6?=
 =?utf-8?B?ZVdRS2FDN21iY2lUMTlETUl6NmFKaDRPdUVDT2tLMGdzQSsrSStZbXRZSDVl?=
 =?utf-8?Q?eMpfxiQSj+PqYwjY1DFko1NRqn9I41Ol6PLSuF8rkDaTc?=
X-MS-Exchange-AntiSpam-MessageData-1: +OgCUI8Hi2kB5w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ad16a1-fdd1-4049-916a-08df02699075
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 05:27:33.2553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNacKmDAui49uU/SEzHDKCUcDsd5baiMaQ3g+sJKQ8jzoobG9pa9/MlDdFX2/+Cgf6/snGAQTXWHxPdTQzvXNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5955

On Tue Aug 25, 2026 at 11:44 AM JST, Alexandre Courbot wrote:
> The `kernel` crate now features a replacement for our lossless integer
> conversion routines. Switch to the kernel version and remove our own.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

nit: casts:: prefix feels noisy to me in actual usages - just import
const_as!, etc and use them directly?

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

