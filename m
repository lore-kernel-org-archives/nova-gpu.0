Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012024.outbound.protection.outlook.com [52.101.48.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1DB377AAB
	for <nova-gpu@lists.linux.dev>; Sun,  9 Aug 2026 02:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786243237; cv=fail; b=tqiqpnMWAILj8Suwxa2tC9j1nhry7iz91QLCiYswzmiJJpzIW7k0AbmcpC7sWGWEVY4L13TnZG8LTC0Tp2ae+mYR3dKsJKxIgCD0guvruSOpb4sPwaKu30qJZkssjMdsKeRm2D5M/4BhEClJjwdyst7MILj8VRSU2Z9P862GZ94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786243237; c=relaxed/simple;
	bh=yOSb2CanGcETAEIm3rH0ptWE1NTS8GV0805mff+eenQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=RvYqVAADPCbtKwKA2J1kOu5DFdNHwV+seiWo7azW6Znv1lYWaqJwgG9XLut2FUvNc0UBdx112MXaIzpGonTEWAV3DIivsQfR6I7dN567nU7IoKPqUDuVD1EXQMld7vcEt4LtAig3uMBnSSu9v/W3PIHgsjBVZSpmCwNRPo86i/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fhxBpJtY; arc=fail smtp.client-ip=52.101.48.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fhxBpJtY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PRPB3QMHQfSn5rRaAVbRC0FFD2BlwuSUgN9kh2EQyW6VCn1hcXlObkbvBgvYqRW/NbB7sW4OfcL0S1vgVOUg+CsECOcGo5ewoa8E3L9Ojatoc+ddjWKZkq+4NsZ8VJ5XI/8g9Sv/DY3ShEmFH0gebFJqLcOd2ZZDFaFnSyuT30xjt0a2EXaTS4a3gO7rbFvLuIDrwPsqMEfWQD1irnW/0i+OvD/9XXS547ZjjF9T+xdnzWQ0sWFywt6csIVzqAwIJMoO3LIDYCwkTNadqS/bYM3icZCG40BemOK5968ReYNlDyCMyHgXnz62oZM1Q9gEVd/xovOafd43D0B1BcLbow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHN3k7sIAhyephDZZpvdQAf7CRHoni1tliykcPvUj2o=;
 b=yXEvu2mBJpbkpi8HmUEvB7v4famQaVOHtlRZm7HXhq+hzsenF3P70yc996TaeFpjAwVtjI+oy5b4vITpGyCXwsEAUHtF5ajDhWcQ15BwiH5QuieDyPk6MiHwZDjLJ0yJAlVKzoPBeZv9DKqWatAyx/lUuMTf2YWnPbwQhCkIx3sGrZfM9TCr86uSWAwIpFXWqfXsNQKuxkKwvFRI4oksy0EhoMeg7IYkEKG5mKsvme/x26gSRmctUgaakXE//ocJ2sJVh+D8H2IP1dCfhxx1OVFuSUP6tOaBOAjJjhkVQc1VdR3yYbWpSm/N+Vbaoqh5IS2KD9Dp5cmJ7Z1cmZsMtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHN3k7sIAhyephDZZpvdQAf7CRHoni1tliykcPvUj2o=;
 b=fhxBpJtY6BWK3nYqtdi0iMLUP+VDBVMskiDOvTk57M5Ac2hSb7j5XL58jPsjdxpEA85e2lpk1eY3uwP0ArbDWL3AltsiL842HO0Aa49rSFN5bQ6FX7iqc5ph0MvAqgHcOgBlS8bEoRLCoDpd2t0LKTO78O7ydVsVXpde8cB4kZhqRk3W5MvOMv8YigkN2yzeSgUI8dmeoy84Obmle2KFd1mS6qPX0AECgbUolaBx9PpavxUGLb9kP+9Gv5a92HADq44plRroMJyuoDQfEzbrhv1D/odkvq+Ca65htXS2Pw3n81MSd+ap24IODSv38wfDS3oMaZU68hynn07HeD8p+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6573.namprd12.prod.outlook.com (2603:10b6:930:43::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 02:40:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0292.018; Sun, 9 Aug 2026
 02:40:30 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Aug 2026 11:40:26 +0900
Message-Id: <DKK2DM3VK6TF.3KBBWP7S4A8T1@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joel@joelfernandes.org>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Shashank Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
Subject: Re: [PATCH 01/17] rust: sync: completion: add
 wait_for_completion_timeout()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-2-jhubbard@nvidia.com>
In-Reply-To: <20260808031120.363869-2-jhubbard@nvidia.com>
X-ClientProxiedBy: TYWP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 780f77ff-f03c-4426-fe62-08def5bf93d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|10070799003|366016|1800799024|18002099003|22082099003|10067099003|11063799006|56012099006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	+M45e725G3VbvuHbfUuDr/zZMM9NhQlL5tKJRyDc6aNABDG5tZu/BODHl5ssWRey5ItAkFABkeEEjCqEQU8jIPMInUVEAvmO8nWeenDdmdryTpMsWU0JOPaAdJNyU5pWfjwmlGhHeHI4gverWLV7uPDYZppa4673SMwfch7jTlnrF3/2hD+AJYWU2f0F03iMIYZAul89ApGn0eCuqiud20CzorPflY9EmIZheUTEc/vHBL3LSiH+g8v7RmzlTsfxuJqHUHteHl0UNqU1T49nDhbNBuxYBvIQhQaaxVb1GytfF+qFZitvN3os0/osoP05JFJM1PZBFgW5V1dH/Gh8G7EEWd4UReI1jJNnCDb4I9R1EOrZdi6XioNlDtA4BcKI6s3qaZdRFHNEXvje1AYBKUpaRPtoGXzn4LBQWggz/l6HyQr7Y37RN7XQ7TEQJYu8kQLJp+g/0cmtyEpF4J1rykhaw8r/9kaByT1UCmqD9Lammp++2dZ9gC8f1QNp5hX4DDo/+3cyoKYZTth3wXoinBCs8HdmRVjNtp1dxACkBmcIRjsEuKrjQ6JwN5k6XkwgYjiBj/bjKGatCpU1OZ+CNysxb7tfGP1GNbrMbVz+nwTNDwKjbT4GWJ+BvfAS0Tw3RDzAuIfUPEFVgf0jPDNbR0zTThLI20ulXSwHZI4x6Hg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(10070799003)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEl5WFZXa05QbCs3KytZOC9BYThadFNIdmc5K0VINnVPZjAxY0hLZUhrUVZB?=
 =?utf-8?B?dlkvR1RaZWsxTkNOZGtqeThQY2JWaE85MlgvbVpydUVWSTNqcVhlL0tRMzhQ?=
 =?utf-8?B?VnQvOFk0QkVUUVBCSFNXUkdFek5DVGRVd1BhcU5JNC9XdXE1T2F1OFJFczZ6?=
 =?utf-8?B?ZEp1N29wSGRqeCtkalhHUDE1Wi9scWhNVlRGMm8zcEZkVGMvWW1DVkMzelFO?=
 =?utf-8?B?Q3NSTlFlMG5ud3cyazh5ZitBalJ2NWxkYTBKSnd0Z0graU1ZZWJUYkd6RXlU?=
 =?utf-8?B?WHVOMWpuVTlyR2Q3R3grSFA2K0Vma3NBd0JQMHJNWHZXOFJQYmg5enlrakFD?=
 =?utf-8?B?ZnhBRi85VGRxTUIreVkwK1JPN1pIampjMk5IKzRUV3ZjSlhZQm1IaGFFcUtz?=
 =?utf-8?B?VlU2QlVSVVQyV2NVYS9mdnh6dk4yK3p1K0VyQ09wTHNDOEhrblBZTlBPdDRy?=
 =?utf-8?B?UHBNT2VEcnpYS2ExMGpKcWFiVm5iRUpNWUlCYU9ZZnRPejhoWTVqdU11WXMx?=
 =?utf-8?B?QXNGMDhRQmJiVjArMnR1bVk1bWVLTDUyV2NGWkpmRWVNSnFSM0tyZlg0bXJU?=
 =?utf-8?B?VFcyaE1QMzFZTzlXd2IyQ1dlQW9reUxmOCtuelEvazdkVExCRk0vc1V3anJE?=
 =?utf-8?B?VkZXcW42MGt5bExIT2I5Q1BTQlZQMHpUTSs2Sk5XdnlocEs5ajl6YmZBSGhi?=
 =?utf-8?B?THFIcjdVVVM0dG5yM2JodTlFZS9XWldIcmdxZkNNVUN4UGZlNGlFSjI2QmZM?=
 =?utf-8?B?Nm9ZRlNtY1htNzBMQzFKbHRXczlZYU1ZbC9ORUVndStyVnk4dzlBUmVuMmRi?=
 =?utf-8?B?UC8rSlExVHRJSTlhNU5VY1B2ODNFTDBEMUNRSDl3S2xQK2VBZXpYNHpMWmFs?=
 =?utf-8?B?bjNWQmFsMXBGd0lFbXVIbEtiQkRVMTRXL1poc2d6bEZhMjVxbWdLWS91dzJw?=
 =?utf-8?B?dXgwRWsrcDVjWWFualoybDVkdkNaSWNPUGpzM0JsbDdKRXdkUENMQ1o5WjFT?=
 =?utf-8?B?K1dHbnJ2a3VaRTU5d2l0T2NnYmJGWHlBaG5iSkE0c3JoNW5WWVUzZXZEOFU4?=
 =?utf-8?B?blcyV1FUa3M0bERNUFpvY05qdEZXOG1kM3FhTkp5Ni90NFBxM1ZJUTV6K1dB?=
 =?utf-8?B?cjNLbkZuSHA0dnFYL2NMZUQ0YUVMeFYvVUgveTFuUDlMNnppdm94VmgwZzY3?=
 =?utf-8?B?MDVCSGM4dWhJeUw3ckpyK2VXZzlKNldUNHZmdEI0NVk4bm53SHhXejA0Q1Q4?=
 =?utf-8?B?QjRKYTJYbzg4ZDRKTitBQUNWZjZORTJoUnNRME9rZmZjNGhCSFBpam1ZWE5a?=
 =?utf-8?B?WmthQlZqdU50Z0ZWVEJiaUNscmRCWDY5SngrckszKzFGYSt2K0JxSUNvY25r?=
 =?utf-8?B?eGEwbVRwODkreG8rcU9pRVFIblVicWRRYldkd0FZT0ZLM1dQNE4waFdpeE9o?=
 =?utf-8?B?SlJtd280VTgwNEcyTEU1TXBUVDZlM3lhOUFYWHh3aExnaXZhejZzTXV5ZFVy?=
 =?utf-8?B?eENSNm15RmdDMjhpSDFWTjVuTXg3ZmsreDRRdC9oUnBIMi9IcnoyV0RoQW0v?=
 =?utf-8?B?eWh4M29uK3NROFBEdFBHZjMrd1J6NnNnaWVCdEpzaVpPbUlrTnlZWHM0OURQ?=
 =?utf-8?B?cUQyQUltUkNhSjRZSXFzem5GYlpnSU9manhtV1hCTzIwM21aYjVrN29xYXM0?=
 =?utf-8?B?RmNPd0dicTNzOHg0YkZWWm43KzFOMFZwMU9zckRUNXhDSEk3QkJqUlVRQWNU?=
 =?utf-8?B?c0FRQUwxOE84eXFOeWpkbkcwSWJoeFNEaldpbEc5UE9lK0M4T0dJOTVOQTJU?=
 =?utf-8?B?WDF1cGRmQ1lZcFZxTWJJaGJjYXR4TUFFY3VrY3NwZFdaOHhiOWpDR3ZtV3VV?=
 =?utf-8?B?Ry9CU3cwZHpiYmtHOEpQcmxIb1lWZFJUY3lqMEFzVUxuNWo2RlFheUwyK3hM?=
 =?utf-8?B?WDRybTFza2hQSlBMSEVvT2lLWlRBN1JESVRIbXlnZ0FsclZzZUJrY2VvR0RT?=
 =?utf-8?B?ayswNlRWMndjR3FMb0JPaUx0bjNyOXoxaENYZmlFUVA5WldidHZiblRaUUlY?=
 =?utf-8?B?ZVFxUzJmeUxYU3VLTm94VUZCVitmWC9WOVpTUHJuRk9qKy9TYUZXa284NVlr?=
 =?utf-8?B?QVU3OVFPOFBjTG1qMGxNOHpZZDl6VlBHVTJOR2FrclFtYnFHZmpXTEV1ZUc1?=
 =?utf-8?B?WC9MRk5oeWVUNUZESElYRFBKWlQ5eXQ1THZCKzNuWld3aUNEVkRHeEc2cE5P?=
 =?utf-8?B?M3Z6bDF6ZjFtZWszZlpOQnFPV3dPN1FOb2Y3REl5bVkrcGdsM0hTcXRja3dD?=
 =?utf-8?B?ODU2VC96aStsV2I3dG5NNndEdjJrbytldGdGLzNiU1kya3FqeEZvaVdsanM0?=
 =?utf-8?Q?KyOnBL1W5rWxWF2UJHAWQvtcQnQCFnS3ZvgMRm7TJiaR6?=
X-MS-Exchange-AntiSpam-MessageData-1: +8VAQuIgc399Fw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 780f77ff-f03c-4426-fe62-08def5bf93d1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 02:40:30.3336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58+gtFaKpNJpfkv2TDXP3E4+HSYQ0VH1qLeM2vl02FCcDV+TAV5B5wKRe4F3qzatk4kGhsl/fNwa0fBl9p+2pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6573

On Sat Aug 8, 2026 at 12:11 PM JST, John Hubbard wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
>
> A driver that runs an interrupt self-test during probe waits for the
> handler to fire. wait_for_completion() has no timeout, so a broken
> interrupt path stalls probe indefinitely. Add a timeout variant of
> wait_for_completion().
>
> Document the type invariant that Completion always holds an initialized
> struct completion, and cite it in the SAFETY comments.

That last paragraph (and the associated hunks below) are a different
thing, and should be its own patch.

<...>
>  /// Synchronization primitive to signal when a certain task has been com=
pleted.
>  ///
>  /// The [`Completion`] synchronization primitive signals when a certain =
task has been completed by
>  /// waking up other tasks that have been queued up to wait for the [`Com=
pletion`] to be completed.
>  ///
> +/// # Invariants
> +///
> +/// `inner` always holds an initialized `struct completion`.
> +///
>  /// # Examples
>  ///
>  /// ```
> @@ -96,7 +105,8 @@ fn as_raw(&self) -> *mut bindings::completion {
>      /// completion is permanently done, i.e. signals all current and fut=
ure waiters.
>      #[inline]
>      pub fn complete_all(&self) {
> -        // SAFETY: `self.as_raw()` is a pointer to a valid `struct compl=
etion`.
> +        // SAFETY: By the type invariant, `self.as_raw()` is a pointer t=
o an initialized
> +        // `struct completion`.
>          unsafe { bindings::complete_all(self.as_raw()) };
>      }
> =20
> @@ -108,7 +118,25 @@ pub fn complete_all(&self) {
>      /// See also [`Completion::complete_all`].
>      #[inline]
>      pub fn wait_for_completion(&self) {
> -        // SAFETY: `self.as_raw()` is a pointer to a valid `struct compl=
etion`.
> +        // SAFETY: By the type invariant, `self.as_raw()` is a pointer t=
o an initialized
> +        // `struct completion`.
>          unsafe { bindings::wait_for_completion(self.as_raw()) };
>      }

These hunks are what should be extracted, or even dropped as
`wait_for_completion_timeout` doesn't add any extra requirement for
them.
