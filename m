Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010022.outbound.protection.outlook.com [52.101.85.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46A8470E94
	for <nova-gpu@lists.linux.dev>; Thu, 23 Jul 2026 08:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796622; cv=fail; b=L9P8Kn3/CUNY017U6HJuTnw/3dh7O5UBMC9HrYnJSI5SbFrmXTo9foXyTXSN9Yg71w+YJk6KoHaEo2ZdjTZX/fF3sr4CiB3lCUYrE10Eq/Kf9aWBN85cnX+otUd12ArRE1Q4gVPbWoSwvnkNHmm2FLSprG34gorqZAEIgLxC2ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796622; c=relaxed/simple;
	bh=xMol4KjY+JjJqKXWwewDs3to8u3dss5FZuTLL+I3+T0=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ddy2GUVQ/YY3IXBqZPgmZEzp36ULf/b5jyxuDhebnEbtRKDCdeYWri3I61wiwnnIvJp4OQ/BrUdso+G2v/KS/uQwaPIH5CkJ1ijvJggfGVR7cWXA6EcayXIVDlt/lC1VS6bHZVSIvqxj+NbUbSFwcLcsHgTEXU1hZeUfDwPlLAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ghN5OwUL; arc=fail smtp.client-ip=52.101.85.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ghN5OwUL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4QY7dxYyBfFIMS/6Ebfd0EIn7foo6BXkIvWbaVYMEcviz3mn1m9FOo3bAzzjW4e5ykg9q4dR9o4kxlk/mV/LwDR3ZuN0Yl7CPFvk/nNxux6M24rvRvpAB2FUQCokccs1saLooJyikK9qVjYuZTtZ0o7IL2814Suig01vhZysL2zoJQunsQlWWGyhln+V80cK4HLBqHBle4E7bMcWw/OoKJnSq8N9aY2pr90LT4xl+fBKWMYMTmjGtF40OeWY/E9rdM6+BTj61TGHygyfOvClVcxopfevHAin1CRPv+2DjFBkQHrGWZ+RmE8FTKi2gnCEGMszG6n82bDd9w8F35LBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SA7akft/YZLyV9zUdYoTh33jgBjDyOJoachs4BayA1s=;
 b=aoSIjP8GVN5Up+9Qf2dFbQcDBnVJgPuPdVaZ5/jn8Zs2PgTvEJ0wVNh8jQeIogPPsthaefdKXSS5jT6HjIdx/hdD7C/LS3rkdJ1eGehlgbE6ftv3DZbo44YIrTto7SQEQ+rlZzGI8P91oBXpeY8JYu2+5HG+LGjX0cGA/nj03xvzS7oUripmw4QKwsJr0oL2DT/7wmrx+CVVyKHJVwQoXf2XWW2RjM2oxxA2swB4R8U6R5GhWHM+fsmn/8Ig6JmCy5rYjVSJxBc9B1L07YOHaXVgSkRxfnmj11qGBVLEtg3xn6trMZgf8g/osfLvZPFi4VDwNCJcYsTuPOAhki5RcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SA7akft/YZLyV9zUdYoTh33jgBjDyOJoachs4BayA1s=;
 b=ghN5OwUL4bx0fYrgJsDloEYIa+GUNz7S4YomQpGrnyr04dq3nvMtm6BNSbD16MHYEqQLUFD7R259QaHCGiWXcuD6qJ95FNujSVSS99CdY8tdLZ6GnagN6vJIVnUetga9PGiIZs0Xx7+8DOE1tJZ4f9AGvKoES/TPzBJLuLLBiifSJaOAzsesuCSEM+Xf6jlGML9dvBbf/uJNFZEX6IvlMC3zzLs0M6La6Mh/52/3XNxWvyXvLJcAY0D8olgWrYzLAKG1L21Wte9na1uvdXsWS7lH18opP172W3qhgPPCsgZ1tAlJHNkJTxiAIxOc1oh7JonWtNRYus+f5Jp7Q5frDg==
Received: from SJ0PR13CA0175.namprd13.prod.outlook.com (2603:10b6:a03:2c7::30)
 by SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:50:15 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::4c) by SJ0PR13CA0175.outlook.office365.com
 (2603:10b6:a03:2c7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Thu,
 23 Jul 2026 08:50:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 08:50:15 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 23 Jul
 2026 01:50:05 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 23 Jul 2026 01:50:04 -0700
Received: from inno-dell (10.127.8.9) by mail.nvidia.com (10.126.190.182) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Jul 2026 01:49:58 -0700
Date: Thu, 23 Jul 2026 11:49:48 +0300
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
Subject: Re: [PATCH v5 5/6] gpu: nova-core: set RMSetSriovMode for vGPU
Message-ID: <20260723114948.08b45f17@inno-dell>
In-Reply-To: <DK5RN7YHXSHI.1BZPR7ET03Z4S@nvidia.com>
References: <20260722073913.1807677-1-zhiw@nvidia.com>
	<20260722073913.1807677-6-zhiw@nvidia.com>
	<DK5RN7YHXSHI.1BZPR7ET03Z4S@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|SJ0PR12MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f58208-4bf7-416a-690c-08dee8976a43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|7416014|376014|23010399003|56012099006|11063799006|4143699003|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	X27M7mkvyYbMx2TTurxaliCQvkhJ5QkhpVtrF1RjGUx7M+mA9eqhOXSt8cqrZS7Ev7sPAh6KKzp4hTLyI46m6pexDgsQa8m6gH0RYyNZt05AfHKXqR4DitNJrP760BC4WSQzyhPAOGPulG1hpU0/NB1atsgWi8oKGv93XcNjPw9VrKHBux/lMd8YIR5cRphdzfszIYA1frDsVJJJqSfXEIhF76PP0/gzIoVb87eYjOjbnL/r8Vtvw/V7XdX04YfmxJ8p/DmkAbdF9/iH90x6g3nVYbqXzghR2j/9PsUm3X9B0IKqyq+reuMBaP6IWav2SAwqweSrvrRrkk7zMrcf1hPwlxwbs7tbW0HWlUMZrG+csitg5dKRKPEyVunbLaAPpy/V5jNOem5yRKw+Fj+Vkul8BZV0KRDCv7qA7MgUifJLGMdXKFwuTEAeOdXfrv8FMj+3HAezCuMRXxUrakTpQIVtchuSViZPTb1vEKVe8ZM9IhwkHXyNOCr/bzIkckDnDkWWXzAH07OtaTBZ8d70inpQXfkLBJ6RGp2DjA6ZOh6GIZRH7tR/BJTDD41aQPsdXNZ9UfgR21N305hlvcD/fxbHcj025KtuZq2vW1GUVEZBxfw6KSiUz/5PSA9nptXXRGFQpaq3L+gk0MmN+QV0La5ZmjLWZQQpQ+ltO+An8h1VLTbcTXb6OvvVY+qh2R18S+/YKvT/3Nq1zXP3LB15lw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(7416014)(376014)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eIv2sX2ygvBqWXGPThUE8/O4bRNyPtUp9XksOK5jgVAFQKLgBq1QzPypZzEfVtefUNtAgH061UaDoVQTO/X2M8n8cFhR3r5t45CgJuYxBJb6+Wo2eGk/OXYdq7WDASG+nSiV0yGyirYuVljY/n/OHNPzKw+Ekox6qUez81gqihIM7DarebgMFHqKAC118hw5BBfYCWAoBU7oYA/+qCphxIDVQQhz3xCcEtVwyPlAR3Lx1bISig0HHthpaNiykiZyiSWE2+pCO7n8S3E7DPcVn3hKF8KduQhqqAnt6el5J3IPoUFxxUR18YFQ/seY9v3gp8gsEW5nbB6qN4M+snaz7cCeOKK6SVqp8qVt21rkyKabRKkg060P/7NirMElcZrLGXC4v/kd7eq8VFRVsWNXUVieuAfnSoH24jAeH9UZzXeoa0gl+XnY+rIFOAOXpGUt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:50:15.3430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f58208-4bf7-416a-690c-08dee8976a43
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6806

On Thu, 23 Jul 2026 16:18:28 +0900
"Alexandre Courbot" <acourbot@nvidia.com> wrote:

> On Wed Jul 22, 2026 at 4:39 PM JST, Zhi Wang wrote:
> > The GSP registry setup needs to advertise SR-IOV mode when
> > nova-core boots GSP for an enabled vGPU configuration. Without the
> > registry entry, GSP-RM is not told to initialize in the mode
> > required by NVIDIA vGPU.
> >
> > Append RMSetSriovMode to the SetRegistry command when the vGPU state
> > detected before GSP boot is enabled. Keep the existing registry
> > entries unchanged for non-vGPU boots.
> >
> > Cc: Alexandre Courbot <acourbot@nvidia.com>
> > Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> 

Thanks so much. :)

> I have submitted a patch [1] to fix the bug raised by Sashiko, as it
> was there before this series.
> 
> [1]
> https://lore.kernel.org/nova-gpu/20260723-nova-registry-size-fix-v1-1-8f471ba00ab4@nvidia.com/

