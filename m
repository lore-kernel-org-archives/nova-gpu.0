Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010006.outbound.protection.outlook.com [52.101.201.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16AE29DB6C
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 01:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780448421; cv=fail; b=VsjgNRu2da2Yyq6nLucjgzqUxz1JxgEYGg11lnsYtX/QcMdspTMOYCHMzFC7Nb3781/eQcfdQMq2shOB0XvIJq5PCvVFY0S9dB0J9h8U/GQb8/JHSB0JQubhkW4aciwNhvVMg21WEwm72xPb6txJoEOT5HHAxp0K634AA54oKs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780448421; c=relaxed/simple;
	bh=XsGbx62mwHOCqILTwlxS6gF0yLLTnvE2hSS9LlI+Smk=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=fNqSR3+bhSpmPOfSgtUtPwVykmABPM56Rh1AIQ+GkQaZ7NjKqAN+HOvnakd6SD/J6vgUt7tt3StTcMllJLuVnLI1fMrhxiwhfZdbcfSICWI6cTTSUBEMlh7GCgo2WpCZAVHq37HPPT66ZFfeATDI66nksTDacBd/NFoeZt+xjuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kzO+PaWC; arc=fail smtp.client-ip=52.101.201.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kzO+PaWC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r31e28ezwMZnkBMqXek9QunGXGaey3C7m2mVW4iTsAfi8qZcfU3LvTluvH7Ut0DohYJoHoG3kvg19xjLZ8LxOvLXudkjc0EdNHl6suPDnacPf5PdjJTSZiKN7KuIzuRyCArhhV4YTlnrg6tccALg1PdChn+tf4nNvp9QEYQi4vEZsOBp+gXJguDyAMJ0aofXM1tykUdgsn5kvTjvEUQt4644SLgTBN5K+ArnIy3HRI5Z58JCdhho+J9NgNui8VPMUEcPbap67uOHzkSJhw9NqFUhRSpCbiKmAr4T+wMGJ2i0998blTOuqQLV/IOG+OtakzXbRBm233AwK1xTHO5iFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRwugbFuRKYlKwYp1gc9aVjGWQo4qX/IjvO0jb56Bkg=;
 b=y3RiFS6sH/ASWlf8Q3yV1iludZKjraHObS2nlrpjyFl5Yp3Ntv3jutjKfFSZE4yGhHP1mK7jrnYozmq1lBZx/2/vUMCppZbCei8TPYtndySgZ+kfS9e81RTGuOsbb08iitAo+vHaHVyBPhiyJUmLHDunv8iPSpkjMm9F3vOJh8AWuV4hhz8e60sci1sxgaNPypGrNExqUV2JxciTbVsv8+HGOhq1yj4grr/KgYWBXbj7crLEHVEm+YjWuYWFfR4qHJ3LNX8c5iPL2EfW1SdLsE6O5s8vvE8edtusWEcGgyRTJnpKp7ezfTwi6+FqC2mAL5+/ZmF8wDWnirJK8w/N6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRwugbFuRKYlKwYp1gc9aVjGWQo4qX/IjvO0jb56Bkg=;
 b=kzO+PaWCNvqK9E1qt/RShDv+kh19xpoG8GYw5TBrsxh15Qk7X27AujK4s+5DIm6c6w6knTE9s/vZ1FjiyeelP3ybZN94hENi1Q2Omj1JKglW2GzkdEABIn/A8ysR/f3YsZbi6z1tYljrGwr4mxnTJN3U+ski+cM7c9IRpBj9S9NXOjqp+HTLCGtllEQ/AuQHkIZxkULwjWeZx0B/k4ZM5iX8vcbvaV7yVy5XjG5/kFoTBvZEukxrxJ+UTtQIOgBW8kFSpRz7XinhntRRWCsm7vIaVvkrGB6RQ8Rdx5wurh0HWJmJfIdVst9cZ8kPcc5o8YcAX8QpbADeIgNolgGi3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB7506.namprd12.prod.outlook.com (2603:10b6:208:442::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 01:00:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 01:00:13 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 10:00:09 +0900
Message-Id: <DIZ0ABOABORL.2FDS2Y50V6O9W@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 15/22] gpu: nova-core: Hopper/Blackwell: add FSP
 message infrastructure
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-16-jhubbard@nvidia.com>
In-Reply-To: <20260602032111.224790-16-jhubbard@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0182.jpnprd01.prod.outlook.com
 (2603:1096:604:250::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB7506:EE_
X-MS-Office365-Filtering-Correlation-Id: f2486691-17b1-4971-01ed-08dec10b77c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	pNMoYW3Iy0brx/jHuryjO5E4ZTLXBQA2jAk4Ml79a0qNii+0dEk1TmgzpfWQv+4vRq+Iid1ykt1XmmNqg4sidWpbwMp9fdWiPbIXqP+B3WBCAAEyfNzM0kUZfKbGclALfSk4zkdiPo35Cap/085OvQqrosCeaxpMGyuLVz+icAE9e5Zr4rrjm5ADL4uCuGApnrsw7K9I6kgj7bcsT0A6r1yGB35MksmSdkznYhZal4N2ebkBCCzliKMeEJ7qBOXajRTN/3dHCt2H0gaiZwsuHzMN6TgG/H/OiGiWKp2BGCuA2sRVmexQjyPmD4pmid41ix/rw31GXoRYtIeM4I1LgxVL3XsgX67EZuIZ/AHO/mT1e9Me1FUnKIrPcgu3IaUBf2Q83rHhBm/kCilb+9qroAAzK6jCm/kO2El8b1sMkWkPDYj5o1qTU10bkEchN16rvTUcSzNfB2O36NGrXjpcu9cEw853q7xAisSZd9gqSQI3q6mCCcrQGQ9aFlT0/88aZcthhChHg5D58E3RznQTCcIh0JStu5nADSCgSC+1gQF42L+y7eqwDX+nTNK8kAVTx3VFuW36UnyqMSUOJIYkalglEvgF0D3Ok3+CBs0FC0tg5BAyaDoA5nBaZepaXOy3QDZraFfk9qdcuFMzck0XFb6bS9WMt+2Wh8aLIGJ11s650rYy78JirZgaAlE05HzV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWxxOTExdGF0NERQV2VlWTRON2tqb2pKUmgyQWpwdU01Qk1zREJaeVAxM2ow?=
 =?utf-8?B?L1NTcjBUbFJMamdncVJMZFJ2Vk93WnNPVzh6ZFRKZnUwZG1OOWtoaEQzb0hV?=
 =?utf-8?B?d0RGNm92SHhVV0JzcGZMMVFnRzF4NENjSUZqK3RHMW43OWNQMnovR2lucUZa?=
 =?utf-8?B?d2d2QnJIZTVvK0diNEF3dlIrQkFXZ1JzUHFFdFN0SkRqUytEeGtvcElwb080?=
 =?utf-8?B?b1VPc3VVREFQbU5jTnhyNSs3Z1lNdHl1N3QvMEpyN2lnSWJxeDc3QlVnRWJB?=
 =?utf-8?B?ZVlxMDlsU2VpWDQycmJ2RUNwS0NxOGxNbEtCaENFVTZBRVI1N1dGWHFZdENr?=
 =?utf-8?B?V2pZR2VEakJoZTJiSG1CUkl1N3IwYThrMHlYcXpWTHJnWnBJOHhVY3ZkSHVN?=
 =?utf-8?B?L1dYSUFLQlBZeWJIcmlVRXAxV1o1VG5aZ0ZzSmcyTW9EL1U3NDEyd0pOZXhv?=
 =?utf-8?B?cXJ4RzlXQVltdDBScDlSS0JZNUJWaGRsUVdrU3B0T0xlOG9LaE03dHVYWG1a?=
 =?utf-8?B?TXIzdGtvYW1vTVhJb3EwOHRSNDVLMkxiWnplMWdFSXJoUWV6ekRIdHhjNWpk?=
 =?utf-8?B?a2JJM1lHQm9ybDUwSVlyN0VnbUtCYk5KanFrcDBmMk5UOUpBenRaellreGho?=
 =?utf-8?B?cFVvbVZQNHdoTnRzWDQ4NkZ0WlhTUFhpRnNwVWlKWk12QUNLOVQrUXpOR1Rp?=
 =?utf-8?B?Nmcxc3NDQklPeG9ta3NXN21tSFRrc0NndmEvL3Nxc3FPUERWS00rblR2ZlFp?=
 =?utf-8?B?VWh0T1BPWWZSNytUV1FYNVNuRXdxQ21lRGYzU0syTEJweENsLy9sMi8xbGRU?=
 =?utf-8?B?T1JkRGh0M1gxb1hEbUJPVytNKzhaWGJJVTVOTzJHTnF5VGMyVDZjVnFaemti?=
 =?utf-8?B?U2xnMU1SaE42UHZkMHJ6YUp5Y3IydjZlNFY0dTU4M2lZZzNYaWRWM1Y5bG1s?=
 =?utf-8?B?aEJnMTlNb1QvSFhTTmF4QjkvSEMrR1pPK1R1WEJTNnoxdVUxTlI3U3lqVXZa?=
 =?utf-8?B?NmZwRDRBWEtTUmVwMUtMQmNIendJNkU0ZXVKZjdiV3J6dkhXcjFjeWIxbTdp?=
 =?utf-8?B?Ry80L09IUFhCTE5yclpNdmZoMnpaaWR4a2s0eXoyRWxqMXNnR3kwV3RycGpx?=
 =?utf-8?B?VGE0cEZ4Qk1xOWh4d2pXd1NnSTVCa0dRYW9tdmxSTFFMQXJ6aHVqZ2dKSndC?=
 =?utf-8?B?bE9zcktRTTNabXhKRE9QWGMwTVQvVzRYV2I2RitmdysvWEM0VzEzK04vYndD?=
 =?utf-8?B?YU1acVpmdlU0NWlqMHpBbDhmSXpqQzh5QThQMUlaakptemZXZnNLeVgzUnJM?=
 =?utf-8?B?VHhyRnN5ak9OTTVxemFsMHR2bFVKbTlLTUs3eDVSc1hFN3FwYkNvaGhJUi84?=
 =?utf-8?B?ajJzNlBIa1hqK1htajJqZURVcFdOMU5iTjJ3ZVVIdHNiSXNZeVdvVHY5VFd5?=
 =?utf-8?B?Si9mdWNzSmJ2NUFtN2ltY0V0czI1RG9jLytYUjdidjJSTkxUVnpuVFJscVlJ?=
 =?utf-8?B?UnNwdi9waFBRS1laM0NmRzlYaXUwb2dDZmtJS1YxbGg0bHBGeTQ4Z1BYYTdD?=
 =?utf-8?B?bEdubGVMSHFGMlp4ZHd1Sm0rNDdMWU02R3lIMm5oMmdPd1ZBZ21mNWFXZ3BP?=
 =?utf-8?B?b1RRcUNrSDBqNkszQTlsanNaL1JtVWFJWVhsTXBnZXFXcjh4MUR2TkxOK2c2?=
 =?utf-8?B?b2ticzJ6dEU5cWQvbTdtRitxTitGRnFOaDZ3YTZzZXJ3ZnRqMW1lUFlXTk13?=
 =?utf-8?B?UUFOV3hJUWtHRDFSSmhRdHJ4TzUxOWdOVCtRcVdPYnFNUExRajVwZ1ovcUNE?=
 =?utf-8?B?M2s3eVljU1hYSzZ1M0Fwbnl6VUJiOFErQVBaKzdoZHRzRXlINUU2aUdXVENO?=
 =?utf-8?B?ZHd2dTVwcnQ0ZTFqWEpXT0pwSEF0UldjbjIxdFc1eDlYNkR4bThsWDZSM29T?=
 =?utf-8?B?eGtMMno0UnlnUWkvVHlMVWpTbzBCREUwVStXN0dNbS9wcE4vcXA0VzhZK3R5?=
 =?utf-8?B?eU14bmN0V2pyTXgzSTJxdEdyWG82L3dKaDFBTHpTV0hZZWYxTUc3b0xaT1d6?=
 =?utf-8?B?OU9UdlEwaHhKZzJ5MitJZG91ekxQTzlhdkV0Ylo0SWE4bnBaOVVOeHcxVXdD?=
 =?utf-8?B?TG1VWkpMVXE2MTFyTGdsdjVYQmpLcmliOS9VeFB6NW8rdnZMWHVpTGtIUzF3?=
 =?utf-8?B?YWYrMzFyUU9PNE5jQTIxaUJrVGFPNGJNdlp5Y2JZU0tPcFJRYWx6a25oaGFt?=
 =?utf-8?B?UXE5Ujc5SDQ5cmoyNTg5MEZEbVBTMXV0TjBUMTZKQWNRMXE3eXhDcGpXeUdK?=
 =?utf-8?B?K2owKzdwdEN4TVlOMTdQYmFZWnY3UTBWWVE2aXhJa1dtODVCZ0FQeUUveTJz?=
 =?utf-8?Q?fIYy9mg7BuKMZsy3FS5/D/d9cQhjo/U0mwKqzz7usqIZU?=
X-MS-Exchange-AntiSpam-MessageData-1: 1gohAvgriVzLyQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2486691-17b1-4971-01ed-08dec10b77c0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 01:00:13.4555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yoz3vJxOB4BBNdM+wwOQKF12i+IujdxktkNyacXlOd8Lte6jtND3rXuAOPGFx97WtEop3gymQ1rV/UAz8eobzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7506

On Tue Jun 2, 2026 at 12:21 PM JST, John Hubbard wrote:
<snip>
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index da7a10c0346a..8c51609d0281 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -576,6 +576,27 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
>      }
>  }
> =20
> +// FSP (Foundation Security Processor) queue registers for Hopper/Blackw=
ell Chain of Trust.
> +// These registers manage falcon EMEM communication queues.
> +
> +register! {
> +    pub(crate) NV_PFSP_QUEUE_HEAD(u32) @ 0x008f2c00 {
> +        31:0    address =3D> u32;
> +    }
> +
> +    pub(crate) NV_PFSP_QUEUE_TAIL(u32) @ 0x008f2c04 {
> +        31:0    address =3D> u32;
> +    }
> +
> +    pub(crate) NV_PFSP_MSGQ_HEAD(u32) @ 0x008f2c80 {
> +        31:0    address =3D> u32;
> +    }
> +
> +    pub(crate) NV_PFSP_MSGQ_TAIL(u32) @ 0x008f2c84 {
> +        31:0    address =3D> u32;
> +    }

For these last two, OpenRM names the field `val`, not `address`.

> +}

In OpenRM these 4 registers are also actually arrays of 8 (because of
the 8 channels for which EMEM is also divided). Although we only use the
first one for now, I think that fact should be reflected here, e.g.

    pub(crate) NV_PFSP_QUEUE_HEAD(u32)[8] @ 0x008f2c00 {
        ...
    }

With user code converted to e.g:

    bar.write(
        Array::at(0),
        regs::NV_PFSP_QUEUE_HEAD::zeroed().with_address(0),
    );

`poll_msgq`, `send_msg` an `recv_msg` should normally take an extra
`channel` argument as a result, but since we are not dividing EMEM
accordingly and using only channel 0 for now, I think this can be done
later.
