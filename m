Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013067.outbound.protection.outlook.com [40.93.196.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C4E38B131
	for <nova-gpu@lists.linux.dev>; Fri,  5 Jun 2026 16:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780675495; cv=fail; b=HPer1HJdSxecIW33RCVV5rMBG4umXY98pq+cYozhBD3IHh4vLY50l9EchOSpM9bcMhIvDq+RcWffaZNJoNyOWOIHpAarpSPjOIMT52JLHthJwcY2NRnAw56DchlOpsAhVICTl3BdJ0vG11bNlusuqXr5poyAwoxqPO+kAIFBNuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780675495; c=relaxed/simple;
	bh=SdLa+GPlMgpTg5QLHOpmlBdPFlxDh75cqcgOHtX7dog=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FuDrP5LPYRmwfV9oXodVlEE2nsyezAzqV6wIY9h3mKZwMQLRa/g0ZqHtKr5nNfz5u3LyJBiVmplDgONccTHLUkAjU3mAo3hAdM/u3HPXB2n/KVgoApj/pUKfZR5nGwyTaMCAPA/1nhFikuK4IsTMhwKesmM08ZCtu/zv0t9SYhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kAX1qT/W; arc=fail smtp.client-ip=40.93.196.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kAX1qT/W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBi0z0JMcsGo9QGUlOuXLR1m/wNc+e225I4XOp/FA0X5KZch+/a+uJZIJ4mFObpobAwZO6B+AHVCqaZYqoosJotCgpby+z87tsqndxgP9WlKaVdTmbn4lbnzYAdlQAWwYkgojCHhuda5CoxqyfxlWJlJkFvxS5i0KYkikP993awm9vwQX/Hiazxh8/g1Ux2nSR2+dCpcW1QwiXSKJv0E+KPMo6XPuDGOQvVE1eRsldhQSCwTGucbBV8iEY3bCj7qFOTm/qg04+CXt0UEEWWCJ+8K+DrD+N+MCk1YcDxQIzjLJPiKr5ueNkoZFudV/44WH7ZbGIpr9ZVqbRghOzASsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3in6Mr/w73FCQnbt3bl17kzjbgsB4SvTAClyboEVGk=;
 b=Pf4fqKWmmUdfh3V7gSSaboFCpFfF2eeUUYmjLYtIikpYP8adF0aqnCo3YKNwYu6T7wa9V9g5jmZ03m8xyXjIDwTwxTEdMgmyUNY8UVZDfccIxzM/O4Eg6OsQvdD5pkPDDxXomKMst6dVZwXNxyDg93ChVuFVaW2XdkY9Hvog1oC2DQKegoq/nZ9a+kUjPgR2GEk8lyFL4hxca4TFxDyG/9/5MfiLbXX5FREhlrKriv2qd6C4XT4vuV12h8MbdfZnMHgbme0Sew4yks8fM+plaiyx9PtMLA/hgdlWrwQEp2prFF/NpKVwXsdUA/oI64GUXbTJ0aCg0h1adlcZEnxCYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3in6Mr/w73FCQnbt3bl17kzjbgsB4SvTAClyboEVGk=;
 b=kAX1qT/WG0u4iDhRGrKnniyLaaKoavB9dOt69gJmAQQVUva4/Uo0fiTetXDbLWgmxbHBWRRXON3rTPLcNAoXZU2iLV3uvvAh6CLefC8zzIMW9Us0sWlnmEou6zTC3VrI6j81DzdXPDQ5DmuyHh39v2ZrL/dHkkSLihlIXsgMWWoDOdR07SpxqX94FURXVyGASGxo+/Sj43XVW32Ap9vOxMk++CgXoR+aVAlh9fZR5KSt3JbVYyXpazgOUtJlI7v4Leo/HrkmnmsMpQfvpWRZatHatV42GBRGJZwbbYELiD/sGCpIsWvh13TO07Hi3IRl1c/XDmyKlGxwZ6aMlyrt5w==
Received: from BLAPR03CA0037.namprd03.prod.outlook.com (2603:10b6:208:32d::12)
 by SA1PR12MB7366.namprd12.prod.outlook.com (2603:10b6:806:2b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Fri, 5 Jun 2026
 16:04:45 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:32d:cafe::8) by BLAPR03CA0037.outlook.office365.com
 (2603:10b6:208:32d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Fri, 5
 Jun 2026 16:04:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 16:04:44 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Jun
 2026 09:04:20 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 5 Jun 2026 09:04:19 -0700
Received: from inno-dell (10.127.8.9) by mail.nvidia.com (10.126.190.181) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 5 Jun 2026 09:04:13 -0700
Date: Fri, 5 Jun 2026 19:04:11 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
	<gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
	<a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
	<jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
	<apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
	<kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
	<aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
	<nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<zhiwang@kernel.org>
Subject: Re: [PATCH 3/9] gpu: nova-core: return FSP response buffer to
 caller
Message-ID: <20260605190411.4877e6d9@inno-dell>
In-Reply-To: <DJ15E264IOWK.3O2HF317B5UDR@nvidia.com>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
	<20260604114339.1565660-4-zhiw@nvidia.com>
	<DJ15E264IOWK.3O2HF317B5UDR@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|SA1PR12MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ebe8954-3081-4510-e4bc-08dec31c293b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|7416014|376014|3023799007|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	oEaNECDv2FkkMcDtqIfHJobswm1Pz6mAeW5+g0uCseGLtPIPGpv4gZ2gLhdLjYormKLPpus37jk2DEgFF4A+IjT0RYNOPUKjHeP3gvXv20JmlON4kJn332ZMOH7LqCX2/Fw2qlShho25qUiribequONzOMID/L589KOhi/E3jZ8NB5U7wd1+ApWaNKGlRJOUm+IbbpRPX48H2Yrn8wGhiobZKlcCd80ccK1Z7fp+H4XPfzZWE0hPuS2BXOGTVOaEcpIL+7CUI8O0VD5DOseYf2OclnY6avXgXXHJpdJzh91sKLeIssCBvzhZLHEhA9xVVFE8jsgpPKyTEd73vXC2ISQdHg5i8OXcPCcmAxFZiUbMrxx75+QugwKMuG1bvFvNkxN8Je0m0yN5a5ogQFUkJyQLFNvOpYm/7YaGoBrhdizKNODOaeGYORFBIi0fhUTJjL49wrQy6p3bKKekzgc+Bj+Wk/iIggcmP52tTBx2jibbDCggxPC/VPmu1NUuwPrGHEgmw27SqDVBkc+K/84RPu2NLNPRUtsOd2+cIypxlHnpVw/kYkT4X4vIlUJVvkvLgVTQoyADaIX0txKd5Aebl0sXgmsXVWJJ2VmBIvkc+xTIIY1TZ3NmWMAedwUN6wkWNpEQ9U24Po1F/o+RqoFKyGlWgXFykQZ4dOXjZHEwiQnVGURV+8OTRSt5jH6w7haavu6SCmVo99Xr9VOnuUBPwUYuAy2oLwm+tUPl0Rdyl7w=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(7416014)(376014)(3023799007)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X/j/u/9H7KykRAgE0Z6vA9GdN7cG7OdX4pCSX3wlZwEiZxwJWdHDcoUcRYKo4k6PSOpjDRbxYfxMeiUNt5XZ0F/uaL0kI9ymgf23dE4vQdV8grA8VHcro6zjc4KXnwGIQySfD1WVe/5MlXmHiEqRLCX5W6BA40H7H6XyEnjI3HbKoOgJJDO3yNvTQ99czsYUrKCVdqTw/vA6MBsIhYvDokZB0YMEAPDfRV+R56en2NLzrwvXSXxuIf3PMrOcHeILfWIErm9rhS5fp86E4EOIfF7mcK3k3ayR8dFhUqKE/gl2wj20x4GSK05/1bMcDhmBUaPg1lkFvh8PGz+Cr/BAz2g91+cFS49nLfjJu7XLERfjrkTDjvXPG6zdACqEy30MeG7KtQ1EMUlTO3YjOhcqWVBkyOE+0ssXENpwcregcTr58xPjoNqgGmH+IHMMZvdl
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 16:04:44.9480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ebe8954-3081-4510-e4bc-08dec31c293b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7366

On Fri, 05 Jun 2026 22:25:27 +0900
"Alexandre Courbot" <acourbot@nvidia.com> wrote:

> On Thu Jun 4, 2026 at 8:43 PM JST, Zhi Wang wrote:
> > Change send_sync_fsp() to return the raw response buffer after
> > validating the common MCTP/NVDM headers and error code. This allows
> > callers to perform protocol-specific parsing on the response
> > payload, which is needed for the upcoming PRC protocol support.
> >
> > For the existing COT caller, the response buffer is unused.
> >
> > Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> 
> Same as the previous patch, I intend to merge this quickly as it is a
> local follow-up to the FSP support.

Thanks. I will drop patch 2 and 3 in the next re-spin if you take them. 
