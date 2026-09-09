Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012066.outbound.protection.outlook.com [52.101.48.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E971242D89
	for <nova-gpu@lists.linux.dev>; Wed,  9 Sep 2026 05:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788932832; cv=fail; b=VMe7Vq4B64fKB+J/C88rqkQotpBUT23uvAZWaY7TucjO3ysVN3DPlp0EDdwuuUWrlkE0NmGau2T5jDYD1n6oe9hnlHic8IZh5WIrdJO4JQO8RxxeMENMccD3Rq7mlduTV1PZzzCq1/Ac+F9OZHsWoCc//vonwKKk9Dw/r8T5y1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788932832; c=relaxed/simple;
	bh=YvvkVzXI0srZrBjQSrsoPKhFRD3izgA+7+IGlZZFaMA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=SzRGw3ERPjlOQgvaQXcFJVTfgB0S5DrCfrdRfoQPhNf3xtXcQdiQNYlab6JO4HdpQHcWTfSdjHZ9GFLkjKJlL2E9gMZ/0IfyEeBpTlWHoDs31g+3VVQ6CwES57Q2jSieCcV8xlDu3sHexkPVhWeEjjWYIt8+85BqoQnioR/pe0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Rc3hQom7; arc=fail smtp.client-ip=52.101.48.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rc3hQom7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8PFyfpZGdayMgD/X/BaXgUgMgDQchDp2Cjkzk3ORW9Zl+96VLd4UtBjjhoUgjpST4b+waGA+IZwZJtXl3OCdErnfz8Yniah02r5WJA775z+aP1Dg8gxxYklqQB6mPaOtU6rMOtvjTduZYP0gFDLysH9DOyz1xZzlCRHvCd7nzlT2XVChtljasQLSPknyRmjf88KqQzeEEMzQjCrjnK8negonkEsgzun8PybAj8+kYXi7AZXBj7FnvvWGV9FnafBWUi+JOWgg8jJrW6edWftUXJm0WLz3YwFDchYcdWjYYj67T9UYEtPg1kE98iyuNurFm+PquVNYSkxgKtWH3ldNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMx86WvMfeESXJHz3xXklX1m00BoXACh5R4g/c1DxvY=;
 b=M+o3VpZaonPnNJf4z5mpAHyvsi1n4SGvyY334Kc0kO19Dl8HncyNSyYbwOYGRR1Ig60cmEGsg4AIgp91cBfDDbEMg9dQcaHOUb0aVoFKERm3Qfws3Ag2sfvHusC8a2HRb4qZ343Vn4tlKY30kPp+c30VsV5zOGU+qVS2ulMz8ZBaMN2ufq/2+uvpjxOdC3x1CuuGsXYn5k672wT1iIDBYGOeexRv3Ib/tesDgnEx8iDlNi/PUH/dN4r46hGK0CwtRm9A6Njn3ZlNwGX0Q1YIdPKBru958DtjE762bHujZowWJeWBqDMZ/ltsjKo0eKcg+HngSlDY8IGs2upAOz6bYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMx86WvMfeESXJHz3xXklX1m00BoXACh5R4g/c1DxvY=;
 b=Rc3hQom7s8CsLyFE8kpaC3uRZrbB6xJY7zRc3HKna5n3y9Bu64ANigjwRbTJjzLsUgfAdjTwnNNiFZcFk8wDc/p0NIyYP0ZuYvsNbZGG4c4ejPJofc8Bt662Mnb6M/mQi2L0utYTXpHprhOWo6oWPCQHvH9TdX90LeNDTPgibepLZokuSvhVy7ty8W0smM3+aR/6DZZV2xg5Ha9po7sLyGclyKgRgx+ToHyzuJPI26oBBR3dc4xIP6tpmgoTgHMwz5mQNmRxoItMA+yr6/2TlO57QEQLZOJ9zfIoEhw2tKMowPa65v6SWxz1IZ5NYFm32F0RB7b1oFQJVvNa/mLpDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 DS0PR12MB7898.namprd12.prod.outlook.com (2603:10b6:8:14c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Wed, 9 Sep 2026 05:47:06 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 05:47:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 14:47:03 +0900
Message-Id: <DLAJRDMODQ7Q.VQS8G9TRN3Q8@nvidia.com>
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
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 00/31] gpu: nova-core: boot on the r000 GSP firmware
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260822015448.238214-1-jhubbard@nvidia.com>
 <DL9ZLUVDKRGT.2RN154EKHPKEJ@nvidia.com>
In-Reply-To: <DL9ZLUVDKRGT.2RN154EKHPKEJ@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0158.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::9) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|DS0PR12MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: b19f50b7-4dfa-43b8-583a-08df0e35c82c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|10070799003|376014|7416014|10067099003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	lGGU5M4cUTpiK/jXmTFHUYX2B678Mk9pDnqK6f/dbOcsBs94UdczgCSgidLyj81UfVRhWFl3Hv20Apc0gg+GgHzKvzmrNFNcSUyp3F2627cSVVaEDpV98oY5Xn7x4eTfmpPziKcxnWXwloXHevqim5b2P9Lw7L0Lqz2b8Gk35H9PbeGP3lyanmOtR7Lc0QNfP24eSFGaq2zgPe1Ajr+FLU0AQQmWn8gVYy6pl/l19FwtFwwlWVVeAgUfAlptm5bYWn0IvO1SkL/8eukjc4hIGpXS0OcAokih6UzKPrzF3t5j5pNWhdx0R7vqr58rSwUyIJc2Dc3zoDDbnL2CVzk/5YJg16/3lJER3E0goK3fBBdQTUrSRHKkn68BflJ2oGCsQk8yewQdrDa/lQnG0JkjP1bwlFhk3URIgqh5CfRrsStl/VOIlX8se3+YbociJV8uEyEK3OBWWJzkrjalnpnfbKvK8BwIxtjCURofE3HKgscdgvaAMbfDDU2GELn05KMkSqIVzbvvG9zdL+0b2O8HnuQFHJVEbY9maU54/C1WnrGIDyHAvF5zK4uoKMz4rxxYN52dknPjo3SEuL8s5vm/6j5pFMkJYj0qOP310S68pBdwA0hHZt5WJ1t8y7Y0vWj+jV2nqQvDErgwXyu47IumD8BQAw0Yn+ABD5jqCFIxnbo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(10070799003)(376014)(7416014)(10067099003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OThtcjJhYTJISHpSd2J3L05yUWxEWm1WUkNCcXNRSEloQ0N3UEdabi9TY1VR?=
 =?utf-8?B?SFIrejZWekFBNGJoVUJncGg4N1RRMEJHZ0dRS1lCOU1rNWMzbUFza0ppTkNR?=
 =?utf-8?B?eUtWd1VFalY5Q2l1Q1lSRzFQMEtQa3ZCSEluNEpST2NvakxsaW14QUYrd2cr?=
 =?utf-8?B?bitzaVZtODRZbUs3WmhvSlBmR2xMd2ZEbTkrUlJGc0FET3NnR21QRytyVGd3?=
 =?utf-8?B?MTUyQjRxVVBhdnlsZ0FpL210ekR5SC9CZ3VzbkIxMXErNTJ0c2l2V0dzQnVE?=
 =?utf-8?B?NmZ3ZUhSRlM2L3J6Wmg0K25ibWtZSldEL2J6MExjU0c3YVVtYWJUNTdSdWNQ?=
 =?utf-8?B?a21YZzZLTEc3Tk5oMkpWcVVZTmFlK1R3Si92YTAzVWZ2QitYc3orQWdDSC80?=
 =?utf-8?B?Q0p6WFpya2prRXhJMEw0WW9VanVnOTJ1NVRQWmpVTVdqYmhlSjRqYWcwdndS?=
 =?utf-8?B?d2ZwbEs0ajJQZDQycnIxQytRTm1KSnVDSnUvYzVXNTcvNytXdUxJZmo5ZDhH?=
 =?utf-8?B?WFo2N0dsbHZscHBrbUR5QlVHb2Z4cmYwRVpiRC9YYysyd2c1TG1wM0dMRGdw?=
 =?utf-8?B?QUVXci9oSDdkYk53UTNWWFpxdFFtdUVSQXB1Q0FiQmZialhMNXZ0K2pFeGRn?=
 =?utf-8?B?VzRJRFFKSXllMGtRN0U4Y0pZNWQ0T0c2bC94TEd5cS92dGo2RDYydTVaVW9l?=
 =?utf-8?B?em1sd0MwVkprd1hmMndQd2NXTGpWaUVpakphTTljeUN4bEl6MlpXQnNHRnNx?=
 =?utf-8?B?YU1ZdTdCWjIySlpkUUI0dGx3Q3oxVmJKZGpXbldjVVhSalhnaUxCT1hvTWRX?=
 =?utf-8?B?VWVBNFAvaER6NXZvcnQwcmdhNXlDUDRRU0hFemw1Q2c1SzN3TE5YYWZNTlp4?=
 =?utf-8?B?YXlkWWRQYUowL2pNUlBBSjdEN3RvcDVpV2U5NnVQeWR2VFMvT1pIb1pvR0p2?=
 =?utf-8?B?djdTZEdZaXE4K2pRZTYzUFZvZG1aaGxYN1pSVXo4K1FETzY1VmI1YkZWaFpY?=
 =?utf-8?B?SmJsY2tzREhLKzg5SmJBelNqS25qNHNYbTJ5cmFhTUlhdU9xQkVYeTJaNEM1?=
 =?utf-8?B?MzBEMkQycGppZ01sZVk4SnFlTjA3Y1phTjFrU1o4TzF0TjVxZnhyU2RJUWJ1?=
 =?utf-8?B?U2hxVWxISkR4eXU5aUk1VlJObEUyemFKVk9IU3VtaG1ZaHVwbTUvZFBxWldp?=
 =?utf-8?B?dGljazNFQUgrZTZoQ3d5VHoza2JTa2c4YnQzdnl1VHlsZTVxYkQ1ejd6N0xU?=
 =?utf-8?B?TWxjZTJQUVVYRDl5RWtTOVdRVk51dXdwYWFNWXVlUzY3NE1VWEZMZExKVHRo?=
 =?utf-8?B?TGNyeURDWm1pYlQxRy8raHVBeHplYmk4TWtEdW9XL2orc1d0QjNjOTVpaUpz?=
 =?utf-8?B?TTd1akw1VmFTRHZHeCs4cW1OMnpjaXVsdCtTQ3c0SnZEVGFqcWR2cjg3OGY5?=
 =?utf-8?B?L3QwenhKMktSKzZnQTNMZHc4OGRaQUFhOGlISFBlaU0xRVRzaVRlQ2ZaZy9C?=
 =?utf-8?B?NUVFemhORXFSSU5mNk9nVGEvcGRoR0RBVUc0MkhBZDBKNlFSdDNIMDNBdEVR?=
 =?utf-8?B?dXNOYUJSNEpOc3N0Y2o3RkZNc2hHM2RIWmQ3ZnR4WjE2Tmp1RmVtNFBxVklD?=
 =?utf-8?B?ZFdaclF1VDFoS2JwOHpsZytJbnhrVzV5U1JoMXZkN2R2N1BtZkx0U2EwTmJX?=
 =?utf-8?B?MGNJWVpBWHdXNjBXWGRraUxLeFF3WkRtZmpKTlNIbTV3cHRiUEVBMUIzeEYz?=
 =?utf-8?B?LzZFbUk1YjhtK01GU21VRXFObUh6T3BnQ2FhOXkzdDIwSW1uRm1UbUlhcmM1?=
 =?utf-8?B?TUVzT1ZhZFZ3bUJCVWY5NEhQYlh5cHMzWStBSk1OL281dGt0K3lVYjVMamc3?=
 =?utf-8?B?aXJqNlp2a3RiNjhLeVd0ZTFnV2plZzJ4ODRzQ0FxK0loZm1LSDgrd01BVXkw?=
 =?utf-8?B?ZkFUYmdoY3lucEZyaGlzZXBhSFFDSmRmUExIOFlpa2pBcGM3bEwwWis0dUl2?=
 =?utf-8?B?bUs0SXlpZDBCbXZsK3hORGFWUnMxOVBXbExERnAxS09pNGo4OTZKU2xTaVdx?=
 =?utf-8?B?WDBmNzhGK1VLYVZZeU5tNFgyeFRaQ21maFMvL21PZ1VSRE9RMFlESkxrSFU1?=
 =?utf-8?B?UGJPNDJGT1V1OUpUS0d6aFQwclFIdjhkRE9oeGpVVGFHbVdTKzNTS042ZWx0?=
 =?utf-8?B?dERZWFgyWkJOTzRjYkN6ZExFWHJnVThlZ1dERlM4K2lJcmhqYlNVRnk1N21E?=
 =?utf-8?B?REQ2KzNTVHNBSWZmaExEY3haRWRodTQ5dkFFVnlxcGx6Q2lCOHJOaGUwYUFP?=
 =?utf-8?B?L0t4eWF6OGQrNUxON1M4VVBZWWp1NmQ1ME52SmpWNGdBNWsxSGo0MDdEdjBJ?=
 =?utf-8?Q?I4Cgzzco9hCNGo0zlnXFUusnLYcCSY20e6MFaubg9+2+d?=
X-MS-Exchange-AntiSpam-MessageData-1: JOKKTrma5Fo/oA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b19f50b7-4dfa-43b8-583a-08df0e35c82c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 05:47:06.5437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4HdqxTU1UAYIEPZXV+cJYpsQsEJhOukyqOxfBhnIgrKC5wjx5sjpJ7Eb85ZKortzgV12A+fwvRx8mxZ4LGa5sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7898

On Tue Sep 8, 2026 at 10:59 PM JST, Alexandre Courbot wrote:
> On Sat Aug 22, 2026 at 10:54 AM JST, John Hubbard wrote:
>> Hi,
>>
>> I'm sending this just a few days after v1, which is soon, but Timur Tabi
>> and Zhi Wang reviewed the whole series in that time, and that led to
>> quite a lot of fixes and lines changed. So I think it is helpful to
>> provide a v2 now, so that future reviewers can avoid rediscovering all
>> those issues.
>
> I only gave this a high-level look so far. This needs some reorganizing
> before it can be properly reviewed. I think the size of the series can
> be reduced by at least a third, maybe more.
>
> First let's keep the series focused on r000: patches 7, 10, 30 and 31
> are dealing with debug logs, not r000 proper. I'm sure they are useful
> but they are technically a different topic from adding support for r000.
>
> Then there is a lot of churn. For instance patch 28 removes 351 LoCs of
> bindings introduced by patch 2. They are not required by the end of the
> series, but kept as dead code after patch 26 because (IIUC) their RPCs
> are removed later. This is one of the few cases where it is actually ok
> to do two things in the same patch: were they removed during the switch
> done by patch 26, their bindings wouldn't need to be introduced at all.
> Actually that's how the sequencer is treated; I have many issues with
> patch 26, but *that* one is ok - a bunch of deleted code is the simplest
> thing to review.
>
> The msgq v2 part also looks more messy than it needs to be. It tries to
> keep both versions coexisting at the same time, even though only one of
> them is ever used at any given time. I suspect it would be simpler to
> implement the changes as part of the switch. Or at the very least, let's
> make the cmdq generic if we want it to handle both, and place the
> differences in sub-modules. This should also simplify the receive path
> considerably.
>
> Patch 26 does 5 different things over hundreds and hundreds of lines,
> that's more contexts than a reviewer can hold in their head. This needs
> to be split. I strongly suspect (more an intuition than a realization)
> that a good part of it is actually intended to land in the
> already-existing preceding patches. Other things can be simplified: for
> instance `Bar0` arguments are added to many cmdq methods, which was
> probably the only way of doing when the series was first developed, but
> now we can store a `Bar0` in the relevant struct so let's do that.
> Actually the `Cmdq` is probably overdue holding one.
>
> I'll give a deeper look at the next revision, which I expect to be well
> under the 3000 added LoCs (famous last words :)).

On a broader note, this series contains several chunks of functionality
that could be separate patch series and reviewed separately. I think
we'd be able to review this faster if it were explicitly split into
several series, as Alex noted there is some churn / patches that could
be put in a better order.

In particular, I see these sets of functionalities that could be done
separately and in order:
1. MCTP transport + cmdq transport
2. GMCAPI cmdq infra
3. Boot events for r000
4. Boot using r000 - that's systeminfo+staticinfo stuff
5. Migration to r000 + removal of r570. Ideally, the migration to r000
   can be the smallest commit to flip from (uses r570 for booth, doesn't
   use r000) =3D> (doesn't use r570, uses r000).
6. Misc debug log stuff

