Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012066.outbound.protection.outlook.com [40.93.195.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0075F3BB66B
	for <nova-gpu@lists.linux.dev>; Wed, 17 Jun 2026 07:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781682788; cv=fail; b=qPyjr8msw4mKhX6B3HzBlZTnt3cAo0PAEU4A3OcDotnOPVF9yi+DKerLk69XvbVrBI3G/ojPZ00J+N7va84FUweVDuhTxq+XAnahn0b5Dz12Z8MB5Q3eKb9L2idMF/JrkFhmK7IIUPnK2nWycxz+/CQL54pYpp8gGoxQO67PDZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781682788; c=relaxed/simple;
	bh=2spQm/8tSEtRBjjm0OSPjX/xVysoCZpySemHUbEW+gA=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AY9j2DmXy5jjbeP+Hj3uyhDBxhdgt6k6Y2p9zP6LrUQ/+cnG1jQnK37hpngyMuYJpCIttXqDUDqf50z5KnZAmOp3kJfKrVl9zLy3eT8E4bO67O/QLP2ra4jcY4Kjv+Z5Xf6NxVDIdeNq6dRfDln5PRti2+SaT7uzFT2pJwggksQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KEdLnUok; arc=fail smtp.client-ip=40.93.195.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KEdLnUok"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AADdqm+p9Md1ohW4FO4eAVaiaPhiaz0pPaKId9VI/SOx8kUpEiOTyhlVWHgbU5usPaWO45AIgVOpNkDMKV45H1XKUtvNbzN0kxe6QgyBtF98erxEi+nOKwYLzrVvNgrwbK66c/TPaE9Qc1QjPL8OAH2kQZ8b9NKynQXaIUOmamaxBnVQPxIplmSi1TqFVpzgbBIr1jkPaEiMfEAm/CsOxg2g49yfz06cNYmULQpEKk+Bd3ZHL1VClkRtco5qFV9pJo5SjJFzFP9hIgdvODrio5KzQ2t0zzFsNg3OqO5KK27sGh5NWsAgi8UxYulZGxJnddqUjpkVW/RqGHG9a5hvgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udN0cGQGrB0ok2/6fsFGT+Iwd/lSma1QdPUehPNhO0Y=;
 b=mdFyVHMkXccnYzDZlpVh/BhM9PRoeopm52Yd/IIVTaInf1rUjWb0D5Bx0X36GYr9RJechvkJN5a8a9Vb66Tma302X7HaBBIDCSAKzkFM0+4TCPKysKm3DKbO01+976LQXZ70L7AxWLy+ZUJRy82oIpnMzNmsmXFJynPI6IWDP25e8eir7sBk2GwQNx8A7VPfTXgKxiAQDyakvtlZ/ws+SQ5xjhl5MZVVX28BFPnnV3xMcEPWTD8DTvkm1os38JctzQORukveGOyyq+zReDeN75t49oxluJ/OasWUwaVEtE9cAaBmLtLgGJTgy6gyg8lsQy0TvAocHhUcJMX8BrXCzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udN0cGQGrB0ok2/6fsFGT+Iwd/lSma1QdPUehPNhO0Y=;
 b=KEdLnUok7baYCmKGueYsHDbW2OWyHTgF468yIfC64fQiOPrp4Phbt6NKaW5VSlu5idqTvek4w9xgDj+Gfr212Yv8Oix9pn1y/BhyamR6m2OrcFV4dpSUVUynGiqt5H/tmemcgmMAlVoAYf8WIJ5BqZPQCuZBWmH6p1sYYPrSGJ1Q/jcQkCoOlSrigRrzgkx5wRIP2pwVH8CwhAAcJ9W1ptGQ7xGnZhXCyTGvXmdVqbS99lViJGx6D9zef2+iIuvXu14EWL2yuYOsQVgvFTF2y2bg2I8P1raxdxdcBJmKzGfoRXFE5MkaWMMddCzCYH1dhDGOF64CBhTbXvfBu77cQQ==
Received: from SJ0PR03CA0215.namprd03.prod.outlook.com (2603:10b6:a03:39f::10)
 by DS7PR12MB5863.namprd12.prod.outlook.com (2603:10b6:8:7a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 07:52:59 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:39f:cafe::71) by SJ0PR03CA0215.outlook.office365.com
 (2603:10b6:a03:39f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 07:52:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 07:52:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Jun
 2026 00:52:47 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Jun
 2026 00:52:46 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.129.68.6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Jun 2026 00:52:37 -0700
Date: Wed, 17 Jun 2026 10:52:35 +0300
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
Message-ID: <20260617105235.5bfa53ff@inno-dell>
In-Reply-To: <DJ4AKSVWGAKR.17JLX3Z610D7G@nvidia.com>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
	<20260604114339.1565660-4-zhiw@nvidia.com>
	<DJ15E264IOWK.3O2HF317B5UDR@nvidia.com>
	<20260605190411.4877e6d9@inno-dell>
	<DJ4AKSVWGAKR.17JLX3Z610D7G@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|DS7PR12MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb783f5-1a40-4fc8-4ea0-08decc45734c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|7416014|376014|23010399003|22082099003|18002099003|56012099006|4143699003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	yHcy+9tgnfFce5PipDmtUTAKVSS3eTYUokbRChRWH28ej4BqWxrldQjsaqk8oh0viLepxBAjlrjsiFIyFEaTBKXKxSX5Ti2wRyVu3A5A7eGVozzLPMNQ9YmgW7sIg+cNthZuCSNzZoj3kSQUwc7nWxi+dXyJgJK3nPxXf9HjF1/EO4L2+7vilNKDqGfBJ1Y3p+I+XuyhtxHhlEILyb2/1Wp7dBxSeb/YmYAeO68g+RSPqr2Z8piCLVamgXtcfruUu644PGG2kWRCXz2jYiY/TwWawhCRZ7mqYOh190TWcNHY9SwG3LKt/m8/nR2CqKOK77oZrqKJpsoHlZTVFYosBMDZuMGGhGnK8Eb5P4hzR2Mx8X8kxQwQBqLvOVYQOk0KX3N6qID1O5lZ77n/EUIg7fJaZBOFG18rrI/GB73T1rWJmSp0842FrtvNNV/9nmXkMR96fx5Av94tycMO7z2DZHoaNFj0On8lH2otCuGrG9ELiwUZyfw0CEckfHmK2FmYcPEJM298JgBsONLKq2aFwEbzR/Xx45pmB2bbxpLx+1lsNK0QovdeWtOmpId6zVh1GgoJG8INx9UXQLH2mqzFcgvhR4j66D8I4r1f216sFtjBnSpObhIgHwBoCj8dYnqDJKDgNCUlpMmmswi/5rkKQy2YlEJ7t3zyIZiVtYckYw26DRGL2Xp9qDyN8vUtpIIVVlG/gosT0nbNxqxnJbvAmf0Yrg/IDHqB6ho59e2iCpg=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(7416014)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jgjzVso5+Z50lrhHcQlN+Bd607IRgC6qI9MD2x5oI39fEaypKrPPXvgzUaznDB16H0ungYQL/pfPMDy9xs6dhTQ5TKeB9gk0a7HZ3wp4O7F3Ye0gd0nKDOjbPGW3NDXvZeKRgpBL1scpBiiaAaTiVzIu4ghVjSemlVjppa8BDah4qHl1RU5O5D4/xxqbRBTv+C5/oUxZi2P1b0OHAPptl1IEnWfQ/ww81DJPk5dPcXcxQiovtSN35iEL6C3yFLYsDZciQ9hLNo3bo9ms0gjDBcrcUlC22rTDweIcwJEtIldUfVQFle4ftt5P8ZNqJFu/EVCVgf947AlofXeBnlEN7nTrOxrcEyAYq8To5weCYUCZG7aIVAo7ltE0ki84xs88wbwaALFzwD5FQWyUXWXAszRPUF/kfuRGpCeAez9r91F2A7YBJTIzRmtyfQW4A6mS
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 07:52:59.2031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb783f5-1a40-4fc8-4ea0-08decc45734c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5863

On Tue, 09 Jun 2026 15:07:21 +0900
"Alexandre Courbot" <acourbot@nvidia.com> wrote:

> On Sat Jun 6, 2026 at 1:04 AM JST, Zhi Wang wrote:
> > On Fri, 05 Jun 2026 22:25:27 +0900
> > "Alexandre Courbot" <acourbot@nvidia.com> wrote:
> >  
> >> On Thu Jun 4, 2026 at 8:43 PM JST, Zhi Wang wrote:  
> >> > Change send_sync_fsp() to return the raw response buffer after
> >> > validating the common MCTP/NVDM headers and error code. This
> >> > allows callers to perform protocol-specific parsing on the
> >> > response payload, which is needed for the upcoming PRC protocol
> >> > support.
> >> >
> >> > For the existing COT caller, the response buffer is unused.
> >> >
> >> > Signed-off-by: Zhi Wang <zhiw@nvidia.com>  
> >> 
> >> Same as the previous patch, I intend to merge this quickly as it
> >> is a local follow-up to the FSP support.  
> >
> > Thanks. I will drop patch 2 and 3 in the next re-spin if you take
> > them.   
> 
> Patches 2 and 3 have been pushed to `drm-rust-next`!

Thanks so much. :)
