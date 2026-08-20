Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012060.outbound.protection.outlook.com [52.101.53.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DDF36B932
	for <nova-gpu@lists.linux.dev>; Thu, 20 Aug 2026 18:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787251668; cv=fail; b=uw9VmqXXHxL/MdsGhV4IGXH6ULuP5jeMniZ4opa8+z2rslq+VdAFMFDuZ8MX0d9SrkbA+VBvuAz6n5dw3ZC4cusji8AsMAJZyEjruF+Kr9v54qm86UnEds7Wa77FmDo4MTZScUCqALqmOIv2HbdAiy1n9z9dIDJiG5NbEJ7NrPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787251668; c=relaxed/simple;
	bh=jp5Nj3z2nCted1ElUa4Wn8K+wgTGMQU5MqKpi9xK/Y0=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M+bYAxPvhya97LlDyk7JOwLJD3Ah9eM03F5fNsR4cAdMesAi+wI004Y+JDa6OITY0wG8BBSsk0roAer9fywNZ2pPmQMqXiIoPtWSnWxcaRDdtbdP8ODhoEwRRIkhHx7fr0+gHHsw/Hr0h0nguFSZJCPv4Ucdk62FdDkbXpGY51k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NXsIRm2+; arc=fail smtp.client-ip=52.101.53.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NXsIRm2+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czWEqFrzsdFBlv0FH+9/53lFSD6V92UXoFfY+yDqFDtSqloCpsviCojskinYOp7g6VB++lVgbmPxYNQquwbtIMyGvbBUTN7F5Mdhs6KGErAYHFUTnuYgtzicWw/UUHZ/LV8kF29E9onV9k/IEBBDJGPnhrCxsFjAudkqCKGR+C4ozHloodoV90n8Oneva8Xcs/3ygCtxRl1beBIHaf5xf8bpyFqxCCBaFZH1LpdPrxV2iMUjjGQEYVpy69tP0UHczmKhWcxFUk7XgPgLJhPnYuWks/K8Uov33gbDyRQXs6BfljVXp3vHBmC1r//XWQkGGgSWrFtJs+LpY+R9cUJf5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQzRq8KX7iTL8y5cMnJKdMPCZiiBk+nQIa8XIOIqAQA=;
 b=tgNG8o28vdALBKQYAEJciXJ/iadJEnLjx0xzB3OAyX7+GO+ToEe/slsx3LaiAgUPQykPI4wIp8HK3pHvWlORm8lA293NR+mx7hZr+MdQzua0JlEeUbBl5LVq6oRczNjbJdE7lHVRZIYweSKW5Uy8R+w4V1bOcBB/Z5sH0DYjJem/K4mexssUVmCG1G/CmoCHJZ619LKJpYfvKWKIxyjVsOlpQM9lCJA0/MLyzm8DZPg7d1245Fe3KUJjjXXtHT8MFIHj6DN10nhpWjGX5fs2QSPcTWSm3f3XXcPU66/Rmp2I1I393OuV584gCgSDiFYLbOtXOsYTVk9aFScfCKZznQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=umich.edu smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQzRq8KX7iTL8y5cMnJKdMPCZiiBk+nQIa8XIOIqAQA=;
 b=NXsIRm2+mygkZiazRY70KpSgjaqUYXa5nCUpbOU407E4xD++1hklm3UG09Fsy6v0AyNl1nb7qnUvPnEryL+hO+LpU6/o7nW/WoVfizM30jVqMZDtjnoHdRzSaGaj6HWKH3Mcfvin4HrPD3VeZtZRy2/klUYaNmV3mmadNvyX0v6r4/puqesjYKw/1tUk84p+6n1GOUL1nY9isKPLRf9b4L8nb1aX5pJKwwbbHi/+7uSh/zinLhGYV1o2rEbTWsyxKpMpmKVYxQ3yuSaVgKz94JnwICDE4K59I10ta2LCkHhNg2TBbV8VYZfz6B9izo5pFSL4BzR30T7EgOunPQehgQ==
Received: from PH5P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::7)
 by IA0PR12MB8373.namprd12.prod.outlook.com (2603:10b6:208:40d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 18:47:35 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:34b:cafe::58) by PH5P222CA0004.outlook.office365.com
 (2603:10b6:510:34b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Thu,
 20 Aug 2026 18:47:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 18:47:34 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 20 Aug
 2026 11:47:13 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 20 Aug 2026 11:47:13 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Thu, 20 Aug 2026 11:47:08 -0700
Date: Thu, 20 Aug 2026 21:47:06 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Alistair Popple
	<apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas
	<bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
	<alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, LKML
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 24/27] gpu: nova-core: gsp: pass the remaining log
 buffers to GSP-RM
Message-ID: <20260820214706.5b0b539d@inno-dell>
In-Reply-To: <20260819035221.336390-25-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
	<20260819035221.336390-25-jhubbard@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.52; x86_64-pc-linux-gnu)
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|IA0PR12MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: 125c6637-0997-4fd0-b311-08defeeb7fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|82310400026|1800799024|376014|36860700016|6133799003|4143699003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DTwiTy/yg2G425TEGEgJ/moxBZtNI1GrRQ47Ggii3C6XUkbzmeFO1lQgOM9tH+PJXaYLOYrIOrz0WZf/8hm2Rregzdgd5L/ug71uAjk1U+xczKtdJiCkZ8OlJnirv+R6l/xL6E2zG/p2if0ItJCdwQ3/6tLy/6R/qb/Zbhuq1NzZuU7XxlRm8Fqmowlngd7EXyRT8A+HYLf/eLrmobcO2gg/GMJ3UXSFTgYviSAtEqZ7YzVj8AVN7pe0kEaWaFoVAFmvM8whSLta8hioRO9yd03EHPE3/pQlAODKpcQIMUYDNvYZFfVI5l2qebs6FYt8L0EOAeJi5Y7/xDsK2OmUNzPZ/yY0+mLvNJKj281HaTknyy4pByDt6Ad0/hMIhsQieWrDA6MF6/klWpB+GHtQLaTDfBavSTXmLSiJ/DYfyI+Yfts+HnqfMEyd+VAEkLSrsPFTZ5CT9bDO8DIP7OFaye2P715l3TOn7gyvjPJxUnUbD61UpMca/yWqYiNFG4JfB1cCKmIzLphYIi+9STKzs/bvYnSffo0cbd+YY/4iUvtB4HWeZ9p6n5P9wb7Bh54Glp3gQAQg+lSdmbbNRSvJnUpXufIvMylnfSix6XtW3APWI55ESA4Mud9wVvybdXnZiEYA0POVHLTN+tRmHJbppJQWbK08sL5v9vWRnLLOUHlmVf7ndyvUpU/mAsFns+lYVNDHixH2bfyVbELWeP9FVA==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(6133799003)(4143699003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DPpArC2kfzA40LGcPr5/lMQB96A35PbE/TZldczZFOpdJO5zklL8F0o0CXg3HMzmiLeNGhwjPP03FcaO5cVLfyKhWd59maw56+G638pauECjYa959vb02TvMRBPbVQhv42JJNL5qLjP70OQ+IvTKKLb+E2C7S5JvwVCnGfN5ScQyviuq9dB9SnzZ6fWfFdKflTdQFx/yh7WCGZnwKxtL4JwMpR88yCW8I8fhHvxqGpuv/QL9BAAgbkFrBZdUBZXWisvWbWcKTx0UTl/DjL8Wh+Uzf00bhKTxaG61RK52BikukWjfdq8/NsyzRlWN7KylyivFNP4zppfjlJPi3qQPbTRtuFUt+AYfgAMpjBow5ubK3B+Tklg4azZAsg/4D1bkyhKUIvNDf/gUqhYgV73V92tZYSWvdrV1ISuLbrth9bEwF2GlHS+tNoySO8/QsQib
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 18:47:34.6923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 125c6637-0997-4fd0-b311-08defeeb7fce
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8373

On Tue, 18 Aug 2026 20:52:17 -0700
John Hubbard <jhubbard@nvidia.com> wrote:

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> The libos loader finds each log buffer by looking up its eight-byte
> name in the init argument array, so a buffer the array does not name
> is never written to.
> 
> Nova-core allocates six log buffers and gives all six a debugfs file,
> but names only three, so the other three can never read back anything
> but zeros.
> 
> Name all six. RMARGS moves to the end of the array, which does not
> matter to a loader that searches by name.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp.rs | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/gsp.rs
> b/drivers/gpu/nova-core/gsp.rs index 232905638169..f1bd66024b72 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -355,7 +355,19 @@ pub(crate) fn new(
>                          2,
>                          LibosMemoryRegionInitArgument::new("LOGRM",
> &logrm.buffer), )?;
> -                    libos.init_at(3,
> LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
> +                    libos.init_at(
> +                        3,
> +
> LibosMemoryRegionInitArgument::new("LOGMNOC", &logmnoc.buffer),
> +                    )?;
> +                    libos.init_at(
> +                        4,
> +
> LibosMemoryRegionInitArgument::new("LOGROOT", &logroot.buffer),
> +                    )?;
> +                    libos.init_at(
> +                        5,
> +
> LibosMemoryRegionInitArgument::new("LOGRMON", &logrmon.buffer),
> +                    )?;
> +                    libos.init_at(6,
> LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?; 
>                      libos.into()
>                  },

