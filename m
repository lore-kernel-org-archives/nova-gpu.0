Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013002.outbound.protection.outlook.com [40.93.201.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA65437DE9B
	for <nova-gpu@lists.linux.dev>; Tue,  1 Sep 2026 05:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788239407; cv=fail; b=sw0hIKQfuErg/WsSSKLqz3cXqzjE/4L7cy78TW+q1blJhWHp9sBveXO2yMNGuoRQJ50k2QDOk7XbU6OvJrFK6HXHOvFv4jMQVqgj9Y7w/tCvd/lV6EFTLXky4GOWDywFD2lgRSLbxe4bq2N5HFa30f+6NjZ0pJBVQKFMYSuvUaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788239407; c=relaxed/simple;
	bh=XSuD+LWXv8JZYWW7j4Qhx1oX6Ahv0xwvyOg7pXh+968=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tOIqSrIjjP+bZvnm8qCkReJaD7WyP9VBIug/Yd2iAvIfgEjQQai6BPMNp6VYmTFcyrDLcSpCDRduT4phqTj8ig9a0/FuYLFP1N5ddOA9eE8J4DsaBIW+U0RwqEHwN0tpvqQeAoEr8DtnUZIDGlIn4y4wWlhhCqcmW2JNrXCh1gI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H2li3+jC; arc=fail smtp.client-ip=40.93.201.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H2li3+jC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2m+KdEK9YyTz8tXR2nkEz1khCuqih4/L7iMyKq/jugwIn2GHfdpVRhjUkpwBI+U+bngx25GLTZqxl+wQtsW+o1XsR4ERD1u7/QL2cHNzk+bvQse7NddznoeFkv/YpJGAFio1SCyzounoi8ow9KMg5cQE7yUB7FICRY00RX06YRW98lN8nlZUkWebBNYpeARIaJ8U9r/QGZ3ua0sm7z01mkxMdgZQTbgQz3Gbg5EjR5V4hZHbuwH4nxj/M380zWGOCYyQDKp8U4HSZ9cwyCeFBI20zzIHWVzSO9O7t9VlMBVc4fgJOH7VWpQPMA8RD+GLzdcWT89Sz+p16tkMeUiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NY6PFUfjeLrZhH/9zjQ0PMr/PhWraFFe/eIt8SwW/Io=;
 b=P2ZDQqu5qxG5QMqTIao+b8QYevlRfOsqykH3aDStvoRhcGcAc7zxRociuM0x6PhwP3PVqBTYp/xMssqqZ5iz28QdPkHKXVF4x6tbHxU+rSx1s0b45weDvoYm/UnPUjtChRmdItcGfTLi6tFpKEWd7MtYV4uZ4tJzwlm/aNhpdNxNGgVSDeehGEke+fXC3ODRp1dpWfHG0aXfw+1vWRdDolzmDa9m65lg9b2qozHE8AjZnz1Vxe3ZBlmuIHcTUy11oaPzy1FUv5/q9lyIS9heSdAYJ/rjpRArgnVUFiu43CAOLIc79wfQx7LjoC/chSGH1IQ5sp4gNFaN865OAohXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NY6PFUfjeLrZhH/9zjQ0PMr/PhWraFFe/eIt8SwW/Io=;
 b=H2li3+jC16TsqvghwMzaKBhpKOlTcJGzAekJIg+14r97VESkxN98GMi59hfm2bWh5ls1Zel98qsjK0RM8MLPF8kv8NIqqg0LSo8aWxqdM4LVlDJ0I6w4MPQi0/7z57NT4b4ErDq11F0t1GTPW9TPJ1buJ1+f0ewwrZor05idgp/ntcyA4ojZ0twRzQXJ+lu405RQHN53bl4LjUy5egdoMIMqqMacSv3eU/Kgljzsdo7itksl9hOMCSrXnBq2QdxvCG9dyu01mZ+C5pP/qDnYECtjG3rbmHnLLeuVCK+5BFIThZWOH6kSm4ghYYtSLrmhjbpn0OCnZZA9UX9eNLfIMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5977.namprd12.prod.outlook.com (2603:10b6:208:37c::22)
 by CH3PR12MB8726.namprd12.prod.outlook.com (2603:10b6:610:17b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 05:10:01 +0000
Received: from MN0PR12MB5977.namprd12.prod.outlook.com
 ([fe80::d8:f725:258:2f28]) by MN0PR12MB5977.namprd12.prod.outlook.com
 ([fe80::d8:f725:258:2f28%4]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 05:10:01 +0000
Date: Tue, 1 Sep 2026 15:09:56 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Dave Airlie <airlied@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, 
	nova-gpu <nova-gpu@lists.linux.dev>, M Henning <mhenning@darkrefraction.com>, 
	Alice Ryhl <aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
Message-ID: <apZbKc5xMQ1yTBTu@nvdebian.thelocal>
References: <20260828033531.1117754-1-apopple@nvidia.com>
 <20260828033531.1117754-6-apopple@nvidia.com>
 <DL373JA1ZANX.21L51RTEUQ2UG@kernel.org>
 <apZCTUYiN5FHCkCm@nvdebian.thelocal>
 <CAPM=9twQxnx5DDkjwXWi-vXM4kqUQQdPaL+=1ASS0tpf2GmnYw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9twQxnx5DDkjwXWi-vXM4kqUQQdPaL+=1ASS0tpf2GmnYw@mail.gmail.com>
X-ClientProxiedBy: SY6PR01CA0129.ausprd01.prod.outlook.com
 (2603:10c6:10:1b9::20) To MN0PR12MB5977.namprd12.prod.outlook.com
 (2603:10b6:208:37c::22)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5977:EE_|CH3PR12MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: 46b01d7f-ca65-4bff-fd83-08df07e746af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|10067099003|6133799003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ODypeA6IiPjIPBbH4Ez8dEJ6KDQbC8FHA4HF3aIGkPp7BB7R5X2i5qIaSFNJdQa1B71usZpGgpzsfP0nMOinxM/13ctu+XgFgap+Oio4do/3QDnNoTckU9oJe4VlW/Ys+/lYuZ5nTNwl8rujOdhXorAKNZ/gkzQyBAZmSISfo15l9EuD/IITn4Z7qR4ZBzHcsjxlQz56196OKguaF/pm2qxGiWgDZkHUUskFmepvvlSsw3I8vSBrRoOkU/Bzd7JMLcz+BROA7vRRquhmF2tU1lvcJXP1JxyZZrnuHN3EiAFs0EJPTHuWkaEDhlP4hDupwYN1PQ/6gqVcM/bgGuG3F63EscJA9Gy5lAulObm2fGpa6lT5lDZt4lAuU2Vt9ZqbR+deQPdUdsHsoOwOy5VXtxXw0FL2EdPpvTc3CUMc+ChtXVBT7PVL6siR5GrIqju53tnGI9Ji5fMKVIRueMDlT0pKc8fSpJPSz5jlbsE9Nmf4n1173S1QWgOsuf0LwXS18zJQqdw3DryY5Z3enlMdNJ46Yu45j+0GTIzmY3A9XeKPq+Brf+1ODmIUph5VrGrmS2IFsIPBCOrGZlB9YFSDxWU41wxMGDOI3t7HQGAMNE1o6m6CwbyU7J13CNPCkBTGW8+MXreZqo0aAoozLzeE12bOglg8KeZ/LZsxHoi3n0Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5977.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(6133799003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2p8Mk4JRpemNaY8UM2pWhtzRIVIMWe0uZiGnfC5shxSYW0YV2/PmmGE+KDWG?=
 =?us-ascii?Q?6cdeggykH9bMz9sBaxLwJDZwvAGd4oysFJtsfv6rWrnkAZ457WXbze3e0MOj?=
 =?us-ascii?Q?kRWViSDgr2CHJkevRBhqAYq9d7LgVyvGzHewXjJMnkkQSuUPc1ssiZcKPSAf?=
 =?us-ascii?Q?yrnKZtMYPn+Zt58YhuXFvmUWWsmVBBD1mGkADlEjRMtHlUGtf9x4PR16ovVL?=
 =?us-ascii?Q?wPfdDfv9RthdH5Js+oNqelULqrs5lFhVbKlPDEkFuEQuQrNEyEmFI3BFSCt+?=
 =?us-ascii?Q?Y02Xya1BVFGQT2wYHxNcNyvIkq9WnEEy5B909dSx1Z3E06+n/YIN7FsKBdpy?=
 =?us-ascii?Q?nv4vzVA6UaiZ0kZKSBIpaYctbG5eufrG+4hyoV69VTW4S3ZnjP8OPyjY3dzE?=
 =?us-ascii?Q?QCof6jUstV9hDWmacty3Ay8lYYVbgRxXlBMRGER+nWu3pcz01cZ4nTmh7hex?=
 =?us-ascii?Q?pDZ0v7/yDVQGiY3zY8VKbpQhvWHFypTCwkEL+6QS+DOCttRwYJ2TFz7EdMS1?=
 =?us-ascii?Q?1zVz22JqvpY7dtL84M8PuZESCk78pOjxDfFjBezJNt5ZlIKRFo7OX4DZnAFA?=
 =?us-ascii?Q?D6qNVulJpurkXmwzVnyBB6jHiMgz6pdNk5nDMLeobNParV/D9539vAcqyQa5?=
 =?us-ascii?Q?tPrzmEJcAo684dP25ziu/ClyN5JceYhYUvsDjDuH4u15sAnfSL+MYgJbuk++?=
 =?us-ascii?Q?oLsHjz9EWRXVjjktGZBZUSLO6yLa6nyeH1RcQAWCXrgiM5ewBchn8c+/GjkU?=
 =?us-ascii?Q?4uaFL9kOWNtnmdZatg6OX6CdcITsmhw2Gq3TkEdbSEthnsFYr5MEVWvbxJ6r?=
 =?us-ascii?Q?f19RzA30WBhfD4O/nRHrNW6+YVnCxFFyQhSEn8/6EGlOryaL88+srnBjWhAb?=
 =?us-ascii?Q?fHIRYxZVM5gBKvemqUxPgJAfWzJ1f0G5BL1Coe5ctw7Tc5P8NX65ncWjKwFJ?=
 =?us-ascii?Q?JuWkooCgArNPlpcgbzbfpzEIL9UTXEI7tVwKFFw/vmUOiiL6Y1gIGfhznzRu?=
 =?us-ascii?Q?J6tHqojhddbytEWIB8cg04AAndCW1xRnis8lA+lQWfKogMVRA/j4t8Knw2O8?=
 =?us-ascii?Q?hy5pwCaP9MNg1QeWnlMDCI9ce3KGrpT9tAd2mw+ImjVVEgKo5FtJjNkxhVRJ?=
 =?us-ascii?Q?/+qtQsvAUKX3LSsZ4fBOT4I+tE//YmyDcjoPAZjKLtvHpejJq3GEtPYBZWLJ?=
 =?us-ascii?Q?UrFGJEkCtVIZ5N/yeJPTP9Tv+WTwEjTPosBnOckLV2PleMdpNChL27RuFBIF?=
 =?us-ascii?Q?KSt2pd7ZUyKDOjTC9QfaGJDPAEWVuYU2IWMcz9HTbeseyGB3r8za1RfBqbUf?=
 =?us-ascii?Q?Cg7qiryep0iMWLjMP6cyh9vATUkfA58BQOdtnD+TPw2HaWlKA/RzRJlnx2LR?=
 =?us-ascii?Q?43UPlTu8zvpyccduyhhi5it3XOA5Hqg0MlyVkBbF2t79lSilWltqTE/awi/M?=
 =?us-ascii?Q?YKdkf7ccfPyf8RO6a85vrbH+UvC/Bpuov/i8gtKy3EmCrJXVbuMwId19vR4H?=
 =?us-ascii?Q?cgtQCCiUDhQsjtId5LIoSTXLTQ7P0mBsOjliDdYTujBUdD43cheHdRTTv3WA?=
 =?us-ascii?Q?OySrpTkXhk8Fq6kEfkpRwDFY2oRBzPsMw7kUGB5aNfrcfXJFRVKPQskrc9RI?=
 =?us-ascii?Q?sbEOop4MihqBQWXkAlflli12VJDfGnXmsyPf42OBvKxqkFEpDZ2sDPSvxNCu?=
 =?us-ascii?Q?xKil5hXwgcoXEcBjjmDShgVsNQ0eUp5TfsxevL50bg5UJOSjSc1HCny6w97/?=
 =?us-ascii?Q?9GKMmyZkbA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b01d7f-ca65-4bff-fd83-08df07e746af
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5977.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 05:10:01.6031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUVwgIVVIKEzZYVVzFvSiO0u7mKEfXpIyvk+6KM5io4EJ+xxSh3/nvQkeVsmMEsWd1v5OlAnva89rltQN0RPsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8726

On 2026-09-01 at 14:50 +1000, Dave Airlie <airlied@gmail.com> wrote...
> > >
> > > We should make the NovaCoreApi just provide an accessor for &Spec and make every
> > > subsequent method we need public. Otherwise we end up with endless forwarding
> > > methods. We can also add as_raw() methods to the specific types as needed.
> >
> > Ok. This is where I don't have a good instinct for what we think should be an
> > accessor/forwarding method vs. where we should just expose the underlying data
> > structure and required methods to API users.
> >
> > In the past it seems there's been some resistance to exposing nova-core or gsp
> > data structures like this which is why I added the forwarding methods. In future
> > we're going to have other data-structures that NovaCoreApi will need to access
> > so it would be good to understand what we should do here so we can keep things
> > somewhat consistent.
> 
> We can expose structure defined in nova-core, we cannot expose
> structures defined in gsp bindings or firmware.

All the fields of self.gpu are structures defined as rust native structures in
nova-core. Their values may be decoded or derived from GSP responses, but by
design none of the raw structures from gsp bindings live in self.gpu AFAIK.

 - Alistair

> In theory we can internally between core/drm but I'd really really
> like to keep that boundary as the limits of GSP for auditability
> purposes.
> 
> Dave.
