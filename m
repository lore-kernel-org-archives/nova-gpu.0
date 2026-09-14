Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012018.outbound.protection.outlook.com [52.101.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE7E25393E
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 00:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789346666; cv=fail; b=la2AUGPSyTCqtqPoA9vfepjiJg0cFQNpqmVKmy5V56BYtBDAhMWdfyReOo0aoa0B340rjiASdnWsPmhf30hM2fgiR6w5WOc+ui1xGlG6W09csd6vAI71HZyHza/gvwwivGVSoCTI4j82AzuT5V96qBe+e6Q2Hxl9hfhkcIkDLoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789346666; c=relaxed/simple;
	bh=iSnXvESOyuTwbERuYpXLFBQB6DKydE0EUvdhuxDtuvY=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=uxabGmHyvOpsAHYggFri++j5VF8RLcHJaBkiYm1ctTaX9IBAdiYmiA0Pkg4iIapCgg6wYwllOWKvhw6ZQa2ohnZjNyBvFPPiUwZgHoT7U2rc25VnBG6OqcyvpDEkMV5Fp/qG/md51p/UzEkKfxvJ33jmCJ+vDZoIrHCDxp2P3Oo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PATt+nH8; arc=fail smtp.client-ip=52.101.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PATt+nH8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=trJ15mL9D80UlI640jvoi71ayyxUkTW5a1vaFTITlC3dqg8AmpSnGG1K5kNO3rVF4bV2Fy3T7javOCmpzJjIB/p9s87Hu67PTzgc/N7YuHR96fOyjnpFOgDum4q64z3DLisB8mv2kpscXO/GfaDHUxB8UuM4I3RuzhFCgdY20icwaaBH24Do7oe3qYJ9wrtDoe4YlgZnSfwr0MvfYpWYQcSmj5L7/68ZseH3vUSgYIiVZXGh5R8B4h5eTjfhIlY2elpXz+IDg6eFgA95PUDr+uldt5SADeq3aNbcuM0km7ZA6fYbGZWyAMfQTn7MoIG/wkavoXhxUOuF8xOeo15+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSnXvESOyuTwbERuYpXLFBQB6DKydE0EUvdhuxDtuvY=;
 b=CE0uoOogg27i06ktW8Y58llprg1x2Sr571XgrF86NmdzSmnRITZtZSTR+aSDlgSlR28t8UuS8fmpW40CAZkom1lYgyy+E10oy4saQggGvp+uu0e3BEBR5E8JbeWDJNdfACWNCzJF7ssJI+YCSpVRXBVusFKLpi0mjly5PY73/LA5sqXLpnajjVYNTdTmOyCRNliEm7fjF0wO1dcbD6rd+cuiZcVfbIEp9paYyOMOSL/hyzSQ7eO2+5R1AMLxfGCbXUX4NNzXX07fsyxo1AfHpYABKk6P5DCM8kSCfH17RJFDaUTdoiEPu6U2bjVCuluMy+JVkfDSj3dKhPP5253nBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSnXvESOyuTwbERuYpXLFBQB6DKydE0EUvdhuxDtuvY=;
 b=PATt+nH8JNJJsEfEMIa6QSqW6zfffoAC4rueIMel1SD0HlWjoqVu7pf12RUTmM7w0fcoiOqOqcM4IvSbwEnvEi3ozvcTyUF9+FVZ0EVQRDWgt/Vl6Rc+t3L3TU8iRCzzxRhpdhv2LvWNOD4EdY0o1rxzWzhQB2ByTcTpLPPTEM4M3Cb3XXKhw8+KmgF7iReCus8fDjBxCO40l7HiXvfiu5w8ldVIZ/DAxY4deZqRRKLvm6n5FZEd3XewcBab4ZARUSS8bslwXtOxzbc7gP6nUb0OZRwj03GQUACYoXrUZfqELZiqn6r5baT6OamCZ4cWXvaxIVtGSwiO5SZlgj9Y1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by BY5PR12MB4196.namprd12.prod.outlook.com (2603:10b6:a03:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 00:44:20 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 00:44:20 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 09:44:15 +0900
Message-Id: <DLEMG9P0WBH0.2KZF2ADUC1YHI@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Danilo Krummrich" <dakr@kernel.org>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] gpu: nova-core: extract radix3 page table into its
 own module
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260913195413.742143-1-jhubbard@nvidia.com>
 <20260913195413.742143-2-jhubbard@nvidia.com>
 <DLEH6H1Q3IPA.2WVRSLX0LL2F6@garyguo.net>
 <edc3647d-62b2-4172-99be-7bce01eb3ac7@nvidia.com>
In-Reply-To: <edc3647d-62b2-4172-99be-7bce01eb3ac7@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0118.jpnprd01.prod.outlook.com
 (2603:1096:405:379::15) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|BY5PR12MB4196:EE_
X-MS-Office365-Filtering-Correlation-Id: e05b4090-93ab-4348-751b-08df11f95012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|23010399003|1800799024|366016|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ggdnrcko6K89vvSMr19pLO34mfEiaAGfWb3lNJp6TKVLyEKU9niISv29P42AMVU32AFInqYOK5AQ5ZLNyeZ9EhkwZC3Aw11tpaAiiurjpJ1tnOrv1NM8xhjxzDzJcR8axgdXav4GweWvuVpER6JItJo5RiaaMFehAJNKYFUaP97hpszYSQUBeh0n2QMYrIkg23yC6VlUVTDydoW7hl05PG9oQi/iajuZL9lryjBhu1e0IpwzebqRTRQm/oAoq+H/WalGe4EV9fjLwW1fnpxE35ZY0lezcAIsIPT5qxnYC+nBF0grlP9otUnUwDB3U7yfBinWDREnBAtZe8ZviDR6d9JvD5kAIu18nj5EcFzk3Y8UnenJnLgjhqDfqGNCUyAJxfUTGfnWAYNF2L1PxB4wG25lC2PyagNt+sRU+me0BxMoFbuPnm+z9Qx/nMgcmZatdt/UFKAhHBMiuHr8fqDWXZALb1ew1t24ZPKZuSnWyPaFr8HyzNmUy8nN0eFyA7hm03hI5aVi+MJkg6cN5ZGJVAMtSVy26VlhPC4p2CyfvP9QDnyr+a89BWMsrjLODMajB+IP8xItxhpeUU71E9XC9jYmaxLX7rB3rZwn4dbfGxS7imUoWuE9iieNemS5S4DK1RPZbuSX71CtKGUbNaFgl68H+ZpcZ/gCBL7/hGw6ZjA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3RMOXU2QUM4Uk9DNXIwTVBzbSsrVlNTN1F3aTZTQ0QyWkw4TXVOcGV5ZGJu?=
 =?utf-8?B?NHczdXBmUHEyRG90WWc2Ti90UUc5Q1p2SVRCUGEzeUZPZGsyNHRQWVduTWtM?=
 =?utf-8?B?aVk5b3c2WkxyYUhJdUVoL2N3aWNEYzNScEJTK21aNzJmVFdlL2d5cEI3MTVM?=
 =?utf-8?B?N3hNS1ZWUmNpVGxSbW4wUDVKTXhaRWFiM2hhdDlpZUE5c0lEZ0RJSXdaMVNl?=
 =?utf-8?B?TFpyRUJzVlZacEVKRlRseVQ4MWNrUHFSWHp3TVovQUs0WWROdk03SVZOakND?=
 =?utf-8?B?djR2dkVPQ2ppeEFrd01Cc2VLZWp4OEE4enZKMUxQY3UyZ09OdTZDQ1pKQ1Vi?=
 =?utf-8?B?MFBGZjRGRDM2b04vM0ZYNE1oV1hvODhENVRpVW52NC90SVVnVnh0MHU5dGVI?=
 =?utf-8?B?SlVOVWt4VTA4RC8zaklENWNDTXdLbTA2SVNHdUZFYnFaOFVOM0NjR2xJVmxQ?=
 =?utf-8?B?VlMybEhxTVJTa1RTNjBqS3JxNXhoa1J3cXFGSDRYRTQ3UzRHNk55bzcvWlZi?=
 =?utf-8?B?MFpNbmhsTHAvaUhaa0ZWRUg0N2hLd0xPNG5oVEVnaVViTFk3eXdJRHAzUmEr?=
 =?utf-8?B?WlJpZklhWDdUUU5LSE9ibnRsaWFrSEUrai9QQm8rNzQwdEJ4ZTNJKzdHU2Jn?=
 =?utf-8?B?ZDl5MDh1b015RkFyOUttcVhRVzBzcmtTZzd6ZW1YcmdqQ1FvNmZzMWxERE93?=
 =?utf-8?B?SzJTUy9EeXN5VkdBZlBaNE45SUVnMG9EMFY5eWU2UllvWHVqaU1Qak5jN1Zi?=
 =?utf-8?B?b3VQYWsxVWZUeUJ4ZWllbDVzZUNXbnI0M2M2T0VPOEU5bTBMMUxXYURPcmsz?=
 =?utf-8?B?SmpObFNOVGxRWk1XTEU2VHd2ZDB6aWdqREd2Nmw4MU03aDhLbXBhOXpsQ0RH?=
 =?utf-8?B?V1J3UGVRVExmWDR3RTJJOXJmZGNHUmJ1ZHk4THA4dkNsOTlaa2h4eTJxc1BZ?=
 =?utf-8?B?VEo1a0pjdlI3bmdqM0ZDT2RXSXEwRnJlVFF3U3Y0WWdlZ2VEWlJ5Zldvckxm?=
 =?utf-8?B?SzJnOEE2WGtiZ3pWV3JpOTFwT3ZhT2dveFFsU1BlMXZVSHZKZ1N2ZHVOOFhH?=
 =?utf-8?B?Y0RUQmg3YU9hVUxlSjJWdFJHNEorVFNHMFVGa2VGT296ME5VdmlsclpaMGps?=
 =?utf-8?B?d0d0bEZiVkRlN0FkZVprcmk5Uk43d2JSK1hyQWxMWU5seVFvakVLaXBSUmRt?=
 =?utf-8?B?RlhKSWdjMDQ4aXcvenI2ejNEVFpXTkxFcTR5S0hOVjVQd3ZKSkpzV3BKc0N3?=
 =?utf-8?B?eFAzY1dWZFhkOWkvUFM5VUxVcHlXN3ZNejlTZTJDbHF4c3dFSTJ3bWFoYXFC?=
 =?utf-8?B?bnpkYUxRN1hON2t1MnBWYkxROGFzVkt6U1c3NXgvZVh4bUdORk9iM3NoTGFF?=
 =?utf-8?B?SDcrSEV2amI3VFgyVlFTMzNtNnpFelBQRjNwRVFEZ0lsR3NCR0I4TjR2d3Fx?=
 =?utf-8?B?eXdBOEl1WWpuWnd1SjFvSEVJZzNhcVNKUGdXd2hwZkl2Z0dmbmtTb0UyejhF?=
 =?utf-8?B?QlZCZHBpSVYvNm4rNzFlQUN2VWlGeHZNU2NsOTAySFFsN0hlSXp3Q3ZLbWt5?=
 =?utf-8?B?MFJzQWo0WXZvaCtOM2JucHh3SjNNVGVDRzRFcnhWSFdYcVVNTGFMVjFaSnd2?=
 =?utf-8?B?bE04RHpCSlo4a3lydWNLQXhDZUZLS3czM0tNa3NzS0hSbGwxQ3hibTV0bjdy?=
 =?utf-8?B?dTZud2ZkSjFJSVVCNW9tOTRZaWMrQnlIM0dpdUJGQjZKak0yRmZVSjBlT2gv?=
 =?utf-8?B?V292a3ZObzZSYjFQRTMweDd2ZGt1dm9BM0hiUnZwMFdoSEYyQm12TUo1eWFQ?=
 =?utf-8?B?MDJVK0pyWmdLMXdHUTVyNytYT0xGc1M4R3JVT05wSXVyL09NdHF3alRuUG9G?=
 =?utf-8?B?Rm5kU1Y1cnR2UDFTWW9wRzlKT0lmRFQ2V1M4c2kyWFFrZ2lYZTh4eFdkdVBF?=
 =?utf-8?B?d1k1SklmMDFkMVZTNjUyS3JlZGlTT3h1VnRzaVBwRUJEcVJkSU1VMTREN3Zi?=
 =?utf-8?B?NkVYaXBCNS9ZNTlGSlNFQ1hiVENaYUZXYzhzWmJaeERDZDcyWWVJeFliVDBE?=
 =?utf-8?B?a1h0a0xmd05ubVdhN1RKcVpKVkQ1TzZGaFVhcnA4bmpUcHduRkpjeTdvSkJJ?=
 =?utf-8?B?bGl2L2tvZDA2Qkw2M09TWGN1RkNvbnAvZHdJUjdmdlFObGtjb1VqWUltTHVx?=
 =?utf-8?B?Ykxaa09lNlJJTEoxU3EycHpyM2J5UzJ0TUsyTHZVenRyVXZRSEJZNjlIbUxN?=
 =?utf-8?B?ek03RGpMVnJjZFN3N0Y1RGJvNUkyT2J3NjJLZVZtY0taQVRnVFVJaWQ3VEwv?=
 =?utf-8?B?ZmlndjYxcXBKWUp0ZTZ6Z0xMb0xpdjZCNUx3eHdiSnhKTnpaaGlpa0dPWWFJ?=
 =?utf-8?Q?sDIlqF6n2e5YcK//U52936AGpGG9Bm3kdLtyrcQ//pjn5?=
X-MS-Exchange-AntiSpam-MessageData-1: UlyY+VtytfS8Jw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e05b4090-93ab-4348-751b-08df11f95012
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 00:44:19.9889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wD5fzxBHGGl+BY2qxfWyl6R/H85CiYh38ndNqUbWSWygIAPLd8eqXhu1hzFnWlm+MuxteWZKClc+tNUwJgCjPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4196

On Mon Sep 14, 2026 at 5:56 AM JST, John Hubbard wrote:
> On 9/13/26 1:36 PM, Gary Guo wrote:
>> On Sun Sep 13, 2026 at 8:54 PM BST, John Hubbard wrote:
>>> In order to boot the GSP, nova-core loads the GSP firmware image into
>>> system memory, and the GPU copies it into the framebuffer, the GPU's ow=
n
>>> memory. The GPU finds the GSP firmware image's pages via "radix3", a
>>> three-level page table of 4 KiB pages that the driver builds. Today the
>>> table exists as fields within the GSP firmware wrapper, which is fine
>>> because there is only one radix3 consumer.
>>>
>>> The upcoming r000 series[1], however, introduces a second radix3 caller=
:
>>> the ucodes firmware image. That is because the GSP has been changed, so
>>> that it automatically fetches the subset of ucodes that it requires,
>>> thus reducing the size of the GSP image. This is a helpful change for
>>> the firmware situation overall, but it will require nova-core to load
>>> and provide ucodes, in much the same way that it was loading and
>>> providing the GSP firmware image.
>>>
>>> Therefore, split out radix3 into its own module.
>>=20
>> I find the name itself confusing if I don't read the docs. The radix in =
"radix3"
>> is actually 512 (given 4 KiB page and 64-bit entry) and definitely not 3=
.
>>=20
>> Perhaps name this "radixlv3" or something similar instead? Or perhaps ca=
ll it
>> GspPageTable?
> Right, it's all about the number of levels, not the radix value, that's
> true. Open RM loves "radix3" so much that I've become tone-deaf to the
> name. :)
>
> three_level_radix works, but is silly long for this.
>
> Do we really care enough to insist on this, though? I'd be inclined
> to ask to just leave it alone.

As long as we agree on where the "3" comes from, I agree that keeping
the name aligned with OpenRM sounds preferable.
