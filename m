Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012015.outbound.protection.outlook.com [52.101.43.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B2533CEA9
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780498446; cv=fail; b=dGA2fV4v3WqFddXFBengrDn4NIYARo+/Jb1iajzY7GDkV/Ao3JlfjpdytEVc9wGAGsMTN5o41QyfSn/8taFC5+hMvYDYZTTHfQ0j/zP+4K5eYsn0WBAZZnwSK93CzHC+cxKCC1Jkb+obaSkNDba75Dm5m6V9BDC3EeU1CA7RfH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780498446; c=relaxed/simple;
	bh=A+BTYrBVOzPDuh0aehMvRqhARUzKVTvb1IVlDOBSlEk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=XaYAh9v008hxM9W+GcRVx/69dFhei71F6jaeG8mG15vyUECeMjkqBnh7bWR0ohv+i4P02S1B3ps+engvaRtymqXjc6de+pBC5PMON6rzvLyWfpbjJRwQ1oAVZvdVyShcotjlS0E9j6NQMz63N2Gjihkr6JuSvZWi4xqe81pVJVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BwqKN+xe; arc=fail smtp.client-ip=52.101.43.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BwqKN+xe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBg/9Ok7pu1F59vRjBuV1W2LMBji9j/AaXANkC+X2sz2VR44NSa4xV9DjS7hDdzdg77gxZPqopS4uG4vThuE7HLVBBwzfFtJcaSRFAYip4CG7OrsSseH2NBmZImlCeNaChGBrwKbse2Ri4Y/HgguR8+zUsYsm2mxhRdqvm8083wdgZmWomdNjC8uth3ix547qiK0pzVxdo3CEpUdofXQLALPBZ1XYwAk6U0Kjgezf77DUWDHRmjPkuGu9t+pqYcJciIbuVDesy2CqD3oWfnxVdwyArjuz5AvegXoc0C4TRf2dR6GGtyjunXPOvBaugBgF/JUXcKE1dPbl/xpHco9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGlQOBhmpCz2x5yuEUQKqr+wh0I2xcr+ozO1Rws4nUo=;
 b=xFVHf9+5i8+XXvO9nJUhpELcDIJk7s9IjkLJqbAtOJj19VcwJ1tLpWyI1k372QMmQAiAxIEpoBhgBWFGcWSypkvBmxKYr1XkmaU8MwbMoGEBu7I9LPaiSOxwDw5BytvVeGb3MJ/Z95UnerNrKvPO6KF6VfSog8AD/6feYD3MAR+K7ltukrakzlSF7xTqfskiKQmFYCRNNvuirbqX7AWAsyupj9AER5V8oXK9SS34oL37JWFLLkolWGIAhkWAouZLJa+dhsgsZkbJKuYhoKz7I4CJdFyZyCwjTeFmJW5XQEqHDQdi5LYbtJpUhh62M3a+slr20B1Z1hUAVxf/xd9Ylw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGlQOBhmpCz2x5yuEUQKqr+wh0I2xcr+ozO1Rws4nUo=;
 b=BwqKN+xewqCxOh9tSPXAEenuMoeBDANFuLOAna+Q/XLXf+dnOcBwL1rRGJhy+KbBauUIMKX2MV79FRsX6KKmDfV3ggTnfHJOYFhMy66PxZeGz0MPkcs+n0SbtXYXzuM8ObyYeMXXySkRK69Yd4xa8oPDRpQsqe5Z1ngngr/E38Lh9KfuBd/S7U9fafzIT4qCPM4DXlKtk744cjWsKlT4C4Rnvhg8aJvsLYh44Dd1Ae3KW3vZWSHJx6qW6GURg3/q1g6w05LmmO4TUMZJbY6bxdwtvfVsPohQVtgfnw92CgBxRAbCdAlf/MlKYy3LzV6dc4lhqIv4N/uUOnM8T35UNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY1PR12MB9560.namprd12.prod.outlook.com (2603:10b6:930:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:53:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 14:53:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 23:53:51 +0900
Message-Id: <DIZI0NBFRIHQ.1VNJD1LZBX80G@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>, "Boqun
 Feng" <boqun@kernel.org>
Subject: Re: [PATCH v13 7/9] gpu: nova-core: Hopper/Blackwell: add GSP
 lockdown release polling
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
 <20260603-b4-blackwell-v13-7-d9f3a06939e0@nvidia.com>
 <DIZC53CCKAUY.2L04G0C2WSVQZ@nvidia.com>
 <DIZE6PDLOCHP.ITQSKNYRZ7H1@nvidia.com>
In-Reply-To: <DIZE6PDLOCHP.ITQSKNYRZ7H1@nvidia.com>
X-ClientProxiedBy: TY4P301CA0033.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY1PR12MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: 679ab160-b2aa-4021-2682-08dec17fee9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|3023799007|56012099006|4143699003|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	5OK0keihxKYXSOjxB+zY95ovbqF1zXue2iYH6T1rLbF3LF5dD+r+RTHWmHEw6sfgbDWLrSc3MwKoXRBAnAwogbJMv4jcRwC9uAhTNg8qQvj7xwH/tSQjpZU7Xe3ZFyt/p7IizI0BMCIbB1s3xzCBMLbpyqb0V5/xMMmp7/HjUHp8522kk00h2/UW2tcJSsxE+J9OiSsCQSgcc7v+tCvzrt4Eqbcmb7pnF/JzwdhrA/fRi5d5apDTghttyxgW43M39K6HRxOFZFFJS6/nkIRqG2MyjYs7eavhDBj2MjfzqJp3tmUXivq8UOjB6zUbGFAvPkmOWUMCOxwL3dnzvZ8WRV/FN9BHHE7Pih0E+Vd3OdtH6n7k2atavCZe5N4/st3htfDMhbHNtXzu8L3di4u7BGn7oocKaF+GC+r/DaAE/+aN8CQ/2lSYMbOauGVDkr9SP6Kkzlx78swyQ8lZ2F1fr+MgtKzYqc5Z6eknLsZDpdKI1vVWW7mamusHz9oZWhZGc5JUYRhFV8mOBczRhMdQIRy0cBf/HcxEPRTSI7DoaAKWz8d9Nv/l1gzLaF1z25cdAMhKMsOa4iVDs6dFUdG1rjT4R5mWiu7c/PS57JyjgKCbtx8L5L2oMnTTHNhxsfgVYGqJIU8+FkAcIW1U76PsP9dpYH8nSZiIStf/3gXMacBLR9Jxa37+tQ3phT2Gp88z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(3023799007)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1BHR1h0ZGF4RHR6eTYyYnpCV2J4T0Q3ejd1MVZtbldpYXJQR203RVJSOFd3?=
 =?utf-8?B?UjRzZTU2WU0wbDFTeVlVcVR6NHN3eWtOZmloS1d2aWZUckpJMVBBbHNFWGwr?=
 =?utf-8?B?RUlydlZ1dXFCTnlOenFtTzQ2Z2lzdjhES2V4NTIxQzJ0R1l6UnBJcVZBMnU2?=
 =?utf-8?B?ejI4SlhkZm5wR0E3NnhHZlo0dE5YVnZVWEdEaU54T1V2REUzQ1luSUJOTCs4?=
 =?utf-8?B?Mm5Rdkx1aG9RcmJQRndaeWkzd0VJaStjV2ZNQmpUeEMzQk11T1NrY0orQldX?=
 =?utf-8?B?ZndhM2dxWVNrVzJhWHNCOFFsU0tVc0svRG4rdGlZYVQwT3FqZTRmck9saDFH?=
 =?utf-8?B?WlhEc2ZLNHNhKzJ0ejlhamJmbFJCbytUQ3NVeTBwL3o2NlVyYzdGMTh4UFdP?=
 =?utf-8?B?anVUZzRqbWY4TGJiTDlZcHY4OHQ1LzRIajhqT3ovUVdDQWhjRHUyeVRWcSts?=
 =?utf-8?B?SzhPcFg2NnprMVhOMjZRR0FURXZ1MkxjcGI4RUQxLzlLMzBRekxzN0I5S1VW?=
 =?utf-8?B?UHhTOG1iNGR2cUVES2JhdHVwcGtmVGg2d0F3RE1XRHdFVGxnd0R6Q2tTR2pi?=
 =?utf-8?B?bzVhWkdjM3VoT21YWFZDeHdFSnM1b09CYTZjc3ArOTY5TTUxSlFtV2FOaEhU?=
 =?utf-8?B?VG1idnZuTDA2eVFmaXZRNm1BOVRQem45Wk40N0JMcmM3ZWI4SzQxc1ZreitO?=
 =?utf-8?B?VDArUUtSU2UzSHZTVk1OTmE1d3pTdmE1WS8xc2JUTWl3NDMrdVphWWJkbGcz?=
 =?utf-8?B?QVdiN1hSN2RJSDF1Q2JJUGY5a1lKbkZkSk04MXIxNDlKWmxSMldxSFUrckt2?=
 =?utf-8?B?RkJTOTRzMkVtOHFwOGkyWDFZM2dVVU1YaEtRYnQ4RE0xQVRqQVd4SkRmOEpq?=
 =?utf-8?B?SFZNcExPalZINTdBeno2TzdQZjlMZU9mOEhxUmNOWWMzRURwbS9uQ0hhM0d5?=
 =?utf-8?B?T1NjZXlSN0lHazlEWUdiMFdia0gvQll1SWRyVURQNXVnK1dmVm9JTGFyeDNi?=
 =?utf-8?B?c2xkam5rMi9TT0FWL2JIWHJtR0dYaUxkZ1krb3hqUVlwMlhaSXpPNFNjZisv?=
 =?utf-8?B?RVZJWGRVQUI5QXBYWHl4K2F0MkdYSWZZYTczeW9EaEhjalhjUk5SRFlOUVNl?=
 =?utf-8?B?LzVaTTQ1SHpwaDRyejR0RzB6ekJ1YlV5Z2tTSFE5R0JqOEw5QjNqNzlRT3N0?=
 =?utf-8?B?bHdXUGhmOFVyakVxTElzMDEzeVFEeTZidVEvbHo3UzIwclM2UGpDRG1uVDRQ?=
 =?utf-8?B?elNoc3liTHNUY3BjdWFHODZzMXBpVkk2NmxxaU45eXRZOXdsdGJOcHQ0a1pV?=
 =?utf-8?B?d3M1eUNQbWg5Ti95OHVFazBFUEV5Vi9SS0pJKytnbWQ3SkxDU2tOL3VHenpR?=
 =?utf-8?B?MjRseUJ6TUdaVDhoaXlPWWNxY3doTWo4eEZKOCtlWDRyZEdZYnJhZ2g3enBN?=
 =?utf-8?B?VWZKVGdFeUEwUVl5djNaTDl6SjF0bW9aeXNMajY3R3RrRWJ5SzRXSTBiak9W?=
 =?utf-8?B?WnAwSXlIUFBQL2s0UGorQlhlbUVPL2FIK09XSWQ0bnJtZjEvRHhua2YrazJt?=
 =?utf-8?B?Sjl5UzZ5MnJxeS9odGU0c3NKMXowTkZObXA1NENTL2ltd1IrOUZzanB1Wnh3?=
 =?utf-8?B?Q2ZmdFBqQncvZ2tuRlpmZUJZOTVoM2o0K1dUQmxmQ1BkOGpHcDQycFBUaGVU?=
 =?utf-8?B?RllUeDJ2M0tJU21LOWdpLzE0azJkWUQyRDZEclM4SVVCR3M4ZEhsOWttVW15?=
 =?utf-8?B?cE1jWHVXeWR0S0FYb3pGS0VKdldSaXpoNC9sbWVaTWxFUC9ubjFCcm5ENjh0?=
 =?utf-8?B?N2Q3QmdDNWdGMVhVbnlCRXFrb1lQazBRZmt0WkhWSm5FZnhVZnR6SllCa0U4?=
 =?utf-8?B?VmhDMXp6c2pQTWNlZjRBWXF6L1dCVW53aUx6MzJWeXdVbHRpMWJTS0NwUU1r?=
 =?utf-8?B?eFR6UVoyWk1IbkZYYkpid2JxTEFQeVE4Q0RrVEdiQ1RaVHh4R2xGdFI3cUZy?=
 =?utf-8?B?SHNQc2R4cDhSeTZZTHhESDF1OHEwSmI3bklBSEdsNmJRK1VsNGMzV2Fjajd3?=
 =?utf-8?B?VFh4ZE9kMXM2cTZZakZCbFJDV29WRmdSbUE5ejZrVDR1Z01iRGZhRnZzeStB?=
 =?utf-8?B?MDVQcDFxQzkvMWVEWDFpWTBaY0kwRkhHWWVRUkpRVHlSTkM0emxmQ281V01Q?=
 =?utf-8?B?Tm13ZDVpZi9QV2x6NzV3UC9VQ0Z2b3BicUZiUlEvanlCVUU4cm5GVmU5TlRG?=
 =?utf-8?B?aUpvelFiWVQrZStZL0JDSXRPYld5c2lJdUVuSGZGblRhZ3IrWkVYY0JnT1dj?=
 =?utf-8?B?STU3dVdpY1RGaHFjeFJtQXBnVGEvNWJ3SVhHUDJMOFFsc0o4SXA3NVZkczhU?=
 =?utf-8?Q?y8AM4w7moS/QxzC2DsdhxV+6X2YIL57qziU7j9noCHGLL?=
X-MS-Exchange-AntiSpam-MessageData-1: G8DBgfIXjXcEVw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 679ab160-b2aa-4021-2682-08dec17fee9e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 14:53:57.0417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/DxPLd+OCauY2Q/CWDDiituxxgYPa3K+vLjRf9Fe3YOotbzXXp8ZtnEK0BEW2HZMRQGPRFU7yMILBt5X6JSaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9560

On Wed Jun 3, 2026 at 8:53 PM JST, Eliot Courtney wrote:
> On Wed Jun 3, 2026 at 7:17 PM JST, Alexandre Courbot wrote:
>> On Wed Jun 3, 2026 at 4:30 PM JST, Alexandre Courbot wrote:
>>> From: John Hubbard <jhubbard@nvidia.com>
>>>
>>> On Hopper and Blackwell, FSP boots GSP with hardware lockdown enabled.
>>> After FSP Chain of Trust completes, the driver must poll for lockdown
>>> release before proceeding with GSP initialization. Add the register
>>> bit and helper functions needed for this polling.
>>>
>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>>  drivers/gpu/nova-core/falcon/gsp.rs    |  6 +++
>>>  drivers/gpu/nova-core/fsp.rs           |  6 +++
>>>  drivers/gpu/nova-core/gsp/hal/gh100.rs | 88 ++++++++++++++++++++++++++=
+++++++-
>>>  drivers/gpu/nova-core/regs.rs          |  2 +
>>>  4 files changed, 100 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-cor=
e/falcon/gsp.rs
>>> index df6d5a382c7a..136d6b24103f 100644
>>> --- a/drivers/gpu/nova-core/falcon/gsp.rs
>>> +++ b/drivers/gpu/nova-core/falcon/gsp.rs
>>> @@ -57,4 +57,10 @@ pub(crate) fn check_reload_completed(&self, bar: &Ba=
r0, timeout: Delta) -> Resul
>>>          )
>>>          .map(|_| true)
>>>      }
>>> +
>>> +    /// Returns whether the RISC-V branch privilege lockdown bit is se=
t.
>>> +    pub(crate) fn riscv_branch_privilege_lockdown(&self, bar: &Bar0) -=
> bool {
>>> +        bar.read(regs::NV_PFALCON_FALCON_HWCFG2::of::<Gsp>())
>>> +            .riscv_br_priv_lockdown()
>>> +    }
>>>  }
>>> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.r=
s
>>> index 883ac4f8b811..872898ffe0a3 100644
>>> --- a/drivers/gpu/nova-core/fsp.rs
>>> +++ b/drivers/gpu/nova-core/fsp.rs
>>> @@ -184,6 +184,12 @@ pub(crate) fn new(
>>>              resume,
>>>          })
>>>      }
>>> +
>>> +    /// DMA address of the FMC boot parameters, needed after boot for =
lockdown
>>> +    /// release polling.
>>> +    pub(crate) fn boot_params_dma_handle(&self) -> u64 {
>>> +        self.fmc_boot_params.dma_handle()
>>> +    }
>>>  }
>>> =20
>>>  /// FSP interface for Hopper/Blackwell GPUs.
>>> diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-=
core/gsp/hal/gh100.rs
>>> index f41f3fea15ff..def41745a30f 100644
>>> --- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
>>> +++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
>>> @@ -5,7 +5,9 @@
>>> =20
>>>  use kernel::{
>>>      device,
>>> -    dma::Coherent, //
>>> +    dma::Coherent,
>>> +    io::poll::read_poll_timeout,
>>> +    time::Delta, //
>>>  };
>>> =20
>>>  use crate::{
>>> @@ -33,6 +35,86 @@
>>>      },
>>>  };
>>> =20
>>> +/// GSP lockdown pattern written by firmware to mbox0 while RISC-V bra=
nch privilege
>>> +/// lockdown is active. The low byte varies, the upper 24 bits are fix=
ed.
>>> +const GSP_LOCKDOWN_PATTERN: u32 =3D 0xbadf_4100;
>>> +const GSP_LOCKDOWN_MASK: u32 =3D 0xffff_ff00;
>
> nit: these constants can be moved into impl GspMbox or made local to
> `is_locked_down`
>
>>> +
>>> +/// GSP falcon mailbox state, used to track lockdown release status.
>>> +struct GspMbox {
>>> +    mbox0: u32,
>>> +    mbox1: u32,
>>> +}
>>> +
>>> +impl GspMbox {
>>> +    /// Reads both mailboxes from the GSP falcon.
>>> +    fn read(gsp_falcon: &Falcon<GspEngine>, bar: &Bar0) -> Self {
>>> +        Self {
>>> +            mbox0: gsp_falcon.read_mailbox0(bar),
>>> +            mbox1: gsp_falcon.read_mailbox1(bar),
>>> +        }
>>> +    }
>>> +
>>> +    /// Returns `true` if the lockdown pattern is present in `mbox0`.
>>> +    fn is_locked_down(&self) -> bool {
>>> +        (self.mbox0 & GSP_LOCKDOWN_MASK) =3D=3D GSP_LOCKDOWN_PATTERN
>>> +    }
>>> +
>>> +    /// Combines mailbox0 and mailbox1 into a 64-bit address.
>>> +    fn combined_addr(&self) -> u64 {
>>> +        (u64::from(self.mbox1) << 32) | u64::from(self.mbox0)
>>> +    }
>>> +
>>> +    /// Returns `true` if GSP lockdown has been released.
>>> +    ///
>>> +    /// Checks the lockdown pattern, validates the boot params address=
,
>>> +    /// and verifies the `HWCFG2` lockdown bit is clear.
>>> +    fn lockdown_released(
>>> +        &self,
>>> +        gsp_falcon: &Falcon<GspEngine>,
>>> +        bar: &Bar0,
>>> +        fmc_boot_params_addr: u64,
>>> +    ) -> bool {
>>> +        if self.is_locked_down() {
>>> +            return false;
>>> +        }
>>> +
>>> +        if self.mbox0 !=3D 0 && self.combined_addr() !=3D fmc_boot_par=
ams_addr {
>>> +            return true;
>>> +        }
>>
>> This looks like a bug - if the mailboxes still contain the boot
>> parameters address, we will keep going and might return true on the next
>> line, which the caller will interpret as an error. OpenRM does the
>> opposite check and has an additional test for `mailbox0 !=3D 0`, which w=
e
>> can translate into this logic:
>>
>>     if self.mbox0 !=3D 0 {
>>         return self.combined_addr() !=3D fmc_boot_params_addr;
>>     }
>>
>> I'll fix it and add a few comments explaining what the code does as it
>> can be a bit convoluted.
>
> Yeah, I agree. I think the logic openrm uses is like:
>
> 1. wait until HWCFG2 !=3D 0 && (HWCFG2 & 0xffffff00) !=3D 0xbadf4100
> 2. wait until mbox0 =3D=3D 0 || addr !=3D fmc_boot_params_addr
> 3. wait until riscv_br_priv_lockdown =3D=3D 0 || mbox0 !=3D 0
>
> So several things are different to openrm (not sure if they are wrong
> though):
>
> 1. `is_locked_down` is checking the wrong register (should check HWCFG2
>    AFAICT). I think we should name this more like
>    'gsp_mailboxes_readable' or something, since IIUC it is meant to test
>    when it's valid to read mboxs.
> 2. other logic is wrong as you mentioned.
>
> Maybe we could structure lockdown_released like this:
>
> // can't read the mailboxes yet (even though we already did but the
> // result is actually not valid so maybe this should be restructured)
> if !gsp_mailboxes_readable {
>   return false;
> }
>
> // we can read the registers and we are still waiting for mbox0 to
> // be zero
> if mbox0 !=3D 0 && addr =3D=3D fmc_boot_params_addr {
>   return false;
> }
>
> // either lockdown is released or some error happened
> return riscv_br_priv_lockdown =3D=3D 0 || mbox0 !=3D 0
>
> I think your suggested change w.r.t. if self.mbox0 !=3D 0; is also
> correct. I think we should update the comment on the function and the
> function name too to say it returns true on lockdown release OR an error
> happened.
>
> I don't know if there's a simpler logic that will work, just commenting
> on how it compares to openrm.

Wow, the wrong register check in `is_locked_down` is pretty significant.
Thanks for catching this.

I'll fix the logic when applying; the resulting diff is a bit longer
than I wish it was, but not so scary.

diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/fa=
lcon/gsp.rs
index 136d6b24103f..98a1c1dc8465 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -24,6 +24,10 @@
     regs,
 };
=20
+/// Pattern returned by GSP register reads while the PRIV target mask stil=
l blocks CPU access.
+const GSP_TARGET_MASK_LOCKED_PATTERN: u32 =3D 0xbadf_4100;
+const GSP_TARGET_MASK_LOCKED_MASK: u32 =3D 0xffff_ff00;
+
 /// Type specifying the `Gsp` falcon engine. Cannot be instantiated.
 pub(crate) struct Gsp(());
=20
@@ -63,4 +67,13 @@ pub(crate) fn riscv_branch_privilege_lockdown(&self, bar=
: &Bar0) -> bool {
         bar.read(regs::NV_PFALCON_FALCON_HWCFG2::of::<Gsp>())
             .riscv_br_priv_lockdown()
     }
+
+    /// Returns whether GSP registers can be read by the CPU.
+    pub(crate) fn priv_target_mask_released(&self, bar: &Bar0) -> bool {
+        let hwcfg2 =3D bar
+            .read(regs::NV_PFALCON_FALCON_HWCFG2::of::<Gsp>())
+            .into_raw();
+
+        hwcfg2 !=3D 0 && (hwcfg2 & GSP_TARGET_MASK_LOCKED_MASK) !=3D GSP_T=
ARGET_MASK_LOCKED_PATTERN
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core=
/gsp/hal/gh100.rs
index acdfb7fc06fc..57e31ef4819d 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -35,11 +35,6 @@
     },
 };
=20
-/// GSP lockdown pattern written by firmware to mbox0 while RISC-V branch =
privilege
-/// lockdown is active. The low byte varies, the upper 24 bits are fixed.
-const GSP_LOCKDOWN_PATTERN: u32 =3D 0xbadf_4100;
-const GSP_LOCKDOWN_MASK: u32 =3D 0xffff_ff00;
-
 /// GSP falcon mailbox state, used to track lockdown release status.
 struct GspMbox {
     mbox0: u32,
@@ -55,30 +50,21 @@ fn read(gsp_falcon: &Falcon<GspEngine>, bar: &Bar0) -> =
Self {
         }
     }
=20
-    /// Returns `true` if the lockdown pattern is present in `mbox0`.
-    fn is_locked_down(&self) -> bool {
-        (self.mbox0 & GSP_LOCKDOWN_MASK) =3D=3D GSP_LOCKDOWN_PATTERN
-    }
-
     /// Combines mailbox0 and mailbox1 into a 64-bit address.
     fn combined_addr(&self) -> u64 {
         (u64::from(self.mbox1) << 32) | u64::from(self.mbox0)
     }
=20
-    /// Returns `true` if GSP lockdown has been released.
+    /// Returns `true` if GSP lockdown has been released or a GSP-FMC erro=
r happened.
     ///
     /// Returns `true` both on successful lockdown release and on GSP-FMC-=
reported errors, since
     /// either condition should stop the poll loop.
-    fn lockdown_released(
+    fn lockdown_released_or_error(
         &self,
         gsp_falcon: &Falcon<GspEngine>,
         bar: &Bar0,
         fmc_boot_params_addr: u64,
     ) -> bool {
-        if self.is_locked_down() {
-            return false;
-        }
-
         // GSP-FMC normally clears the boot parameters address from the ma=
ilboxes early during
         // boot. If the address is still there, keep polling rather than t=
reating it as an error.
         // Any other non-zero mailbox0 value is a GSP-FMC error code.
@@ -100,14 +86,25 @@ fn wait_for_gsp_lockdown_release(
     dev_dbg!(dev, "Waiting for GSP lockdown release\n");
=20
     let mbox =3D read_poll_timeout(
-        || Ok(GspMbox::read(gsp_falcon, bar)),
-        |mbox| mbox.lockdown_released(gsp_falcon, bar, fmc_boot_params_add=
r),
+        || {
+            // While the PRIV target mask is still locked to FSP, GSP regi=
ster and mailbox reads
+            // are not meaningful. Wait until HWCFG2 says the CPU can read=
 them.
+            Ok(match gsp_falcon.priv_target_mask_released(bar) {
+                false =3D> None,
+                true =3D> Some(GspMbox::read(gsp_falcon, bar)),
+            })
+        },
+        |mbox| match mbox {
+            None =3D> false,
+            Some(mbox) =3D> mbox.lockdown_released_or_error(gsp_falcon, ba=
r, fmc_boot_params_addr),
+        },
         Delta::from_millis(10),
         Delta::from_secs(30),
     )
     .inspect_err(|_| {
         dev_err!(dev, "GSP lockdown release timeout\n");
-    })?;
+    })?
+    .ok_or(EIO)?;
=20
     // If polling stopped with a non-zero mailbox0, it was not the boot pa=
rameters address
     // anymore and therefore represents a GSP-FMC error code.
