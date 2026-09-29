Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010054.outbound.protection.outlook.com [52.101.56.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62EE361962
	for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 16:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698315; cv=fail; b=aFi5m/j6pHYDHFgdi0DP79E4ky16vFOCeoz4AoERdxOI66xfRwqDaXx7vqHbcasF0kfMSkAJXEg2v/8Yf+eUer84Yr/P5aqxOCOsJGdOKnqHLLjCEN0nHZ0a2P/Z+JueLftRNvKO4NA/c6N0HIFf2/OSiiAPnfFYa8t18zbuJkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698315; c=relaxed/simple;
	bh=f+JmzeWa1c9lgEMVRWCYz1iYp1x/tngMzHWyXPil2/U=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fNPx1jH2fALFHwR5sVsoSCRpzYSF4WLzZQtQ3KpmUC9E8rl06BIf9ZMwPE4u+NAbTqt6uzRKNGww4JpqCpfzN6FFk11hiEkPcB0TiirCDKZ/N4Su5Fb++jKNFQgXyZHLS3AI4Oim35rr3qM8Dntc8b+cn0QZCjuDYckpdaycuHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DJyXB2s7; arc=fail smtp.client-ip=52.101.56.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DJyXB2s7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPTltaRiCLOwpstBNkawJu675Akl8LAI6pLMuzIQgC4/AHZaOA3tGX8m5KUo+/ZRNbzi+5l8l/sV3o2Fr/dWwjOjL/CraQAEGLBJ7qSOLlUDG/UldBBENz9hgbE8XBtvhEKuw6ze7SuFVBlz/1TINXSvW7UPBglN3Kb2Fk/IFyVS5X700Jco6Baf5SskbuHPkWXukBoeGbrAbgOfwgBF+XmMEaPk4rc46031BcFJdjA/BN+dC7yVa8WwKwcGbLhA8mjhSQpVX/ZcLyWoDUy+PiVGm5fG+rL5NH17re4Jj9OdvkXr6jvx0DCcnlGZzzgPW0vqYUuyDDaSLTGrQ7dBkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F801WrOzZxejFe30ahp0VaYp+9TkEGIGjlIKKwSttlg=;
 b=QFyXZyfJB+XY5go3EF+XH1OgehUOZMlnT3LJAYqRORXoen0mWqR4Ki0CNfgUxtRgn2DX5oetfWeP6nv7TnNnbtsTrosVA9LkhLiJd5vHcwCsozPrfFmRt8HPIxPAQ0iXooy9gwYM998LLXkHO67WjJ5cKOPlOEODyk6z8sMssCwpap8jBi6WnvkcIv/ov5cQ74N/Fn9MbRRfY4Wubmj9Cit9+uzmvsaAaRN7ucDMlfXVFM7U2n9n6+dwnvjcnaj7UA3c07fHK+NcT9B56frHW33FLl1pNGSZO/sCD1zRyQQs2KeJSLwKg5GBcebj1ngpDJvOc5rPFhu6lAV5rH5Miw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F801WrOzZxejFe30ahp0VaYp+9TkEGIGjlIKKwSttlg=;
 b=DJyXB2s77Gi8tOczHoCF+09l9cvR6H11Q6NYRNCWWW+AAPwpS7KCBhg5C4+SQyuG9vgP2/GeHsVVg9JgCkyqJoLURkRXmUyibIYowQW+c2nH0NVHApzAoBat/awIfT0y0bhjzRIISxjRKdbjJjPTVIojztj+batU2ZJptDahoDVKAGtevkRUmprRznbaohM8TvM65gBtFeRRWkwibxeZkGfaKTtTp3aEME5Ze0OO2CZKIQ0/Dx9KBIl8XzHMkA9W89EPHQ77hw+54xZZRcSfBV0eryv/pR2MxWlQwDspfgKhPcIgrHNT+889uw2JR8lknieTsw6+/8464LrZ4bZjRg==
Received: from SN7PR04CA0056.namprd04.prod.outlook.com (2603:10b6:806:120::31)
 by IA0PR12MB8648.namprd12.prod.outlook.com (2603:10b6:208:486::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 16:11:44 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:806:120:cafe::aa) by SN7PR04CA0056.outlook.office365.com
 (2603:10b6:806:120::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 16:11:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 16:11:41 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 09:11:04 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 09:11:03 -0700
Received: from inno-dell (10.127.8.10) by mail.nvidia.com (10.129.68.6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Tue, 29 Sep 2026 09:11:00 -0700
Date: Tue, 29 Sep 2026 19:10:57 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
CC: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, Gary Guo
	<gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>, Timur Tabi
	<ttabi@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
	<nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 8/9] gpu: nova-core: gsp: move the RPC commands into
 a sub-module
Message-ID: <20260929191057.7203a154@inno-dell>
In-Reply-To: <DLRVMM6HVO54.NV3FUAYPC7UU@nvidia.com>
References: <20260927-cmdq-rpc-v2-0-c3f66ae73be4@nvidia.com>
	<20260927-cmdq-rpc-v2-8-c3f66ae73be4@nvidia.com>
	<20260928122015.3df66b3e@inno-dell>
	<DLQX62L47S38.1D5416RRETLY3@nvidia.com>
	<20260928181106.06eca8fc@inno-dell>
	<DLRVMM6HVO54.NV3FUAYPC7UU@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|IA0PR12MB8648:EE_
X-MS-Office365-Filtering-Correlation-Id: e5dca87b-b02c-4bd8-1e92-08df1e445933
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|7416014|11063799006|10067099003|3023799007|18002099003|22082099003|56012099006|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info:
	ZRBl55wsJkYML2AbCHt3XkB7ZDdBgO8LiOigG7Ti+ID0TV9Tj8YE0PqAYoDCjdGxR9CxRD0zGYsLV2oUrXMLNFhr8dxI7KJw+UmtheIEyXXieDM/iqTBx6Nl3OlCsBZ3brNAAqEMqWxi7VUzaUlJjDxf7RoDvZF/pFn8TtHZlI8ADHW4+h7OdvNBRnoOU5JfJKvYRB2A+b1Fpo+t4BE/EuGUfpA/0rPNMGR1Scj10ccExDXNuTPdXREcXQAOl+VgsXqJ5rBe+lTMkty4rPOw8cq0IEKY7axGmQaMWHtFYy4kjZyqbrJJLRLuzpQgCt/UlJdA7iTQVvlxu8BjvQpGS/7SSR6odxEb9lKuVYzTZWXFJFC3N61qjbzVBwqazorVa0tRKSsEBTA03XxmWT5pqR8SiPlpW9Mna8EDXAXPZqgqlDoHdxcd5XlngmuZypfgMEhRjJU25jCyXMOUZG6BU15TCLYEXYovsnJjZULehOLdbLaeaNrAFlYnLNDW9xf/YlCNxjJFxYf0919QpOpFhT1w7SgV2B+PzFcLI+rgZIg6uBGzuljbJHRLajOnOmWrSzgc9GtoBF+EEnpA5HQV6qjepbW3Xp5EoxOAJdDBs3xyQFvqXD/Pms1xm3264j0/pb+O8ZqYfxlTWPWgJECwpLMKhsehGJ9/35izXxzFrx4B3hqI8o8KsIDmhPe5Od3hA1gM7ZFBaBDl8/uiA2rWzg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(7416014)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003)(56012099006)(4143699003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vr63DmddEKq2aE8rwg0sVlFWm2VjIannNq3E9Ho57SlHLbbnnKhpCZQ3WN4a/p5nwejF2xb5RQr5jRv5+2pXhLT8W+Qp9RO84zWLFghnMRIAJeu3Fjua1wdgxu/0W7eaCtR0AeJThXtYk2JT1Eh/X0N59/wqoQQqKQfuOu4RSHDqbyr5I0t63YKuo3A06frYdRwUaBBI+jv0rpqxMfuryyRoHdqyCBdXBsbik84Z6Y4y8h7WWN93XeDkoycFZhhy+iTXfPkMaU+wczeVFH0uG30OoSRRR/g7E4uv4xgPlTRiTWYEtvS2KcwvULJU6ssTxcpWVeZwQ1+jf2FrTSoaXRibbmRIjjwDKmatqSmXDMB3LE4B2RGynQkeODMvrNDcID5kwingtvYUahvBppvVp2zZrmfQZBfTLgS6eNtLwRxOTzkNRmgoejuS15EjYyGc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 16:11:41.1980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5dca87b-b02c-4bd8-1e92-08df1e445933
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8648

On Tue, 29 Sep 2026 23:40:22 +0900
"Alexandre Courbot" <acourbot@nvidia.com> wrote:

> On Tue Sep 29, 2026 at 12:11 AM JST, Zhi Wang wrote:
> > On Mon, 28 Sep 2026 20:40:08 +0900
> > "Alexandre Courbot" <acourbot@nvidia.com> wrote:
> >  
> >> On Mon Sep 28, 2026 at 6:20 PM JST, Zhi Wang wrote:  
> >> > On Sun, 27 Sep 2026 22:46:25 +0900
> >> > Alexandre Courbot <acourbot@nvidia.com> wrote:
> >> >    
> >> >> Move the types and code related to RPC commands into the
> >> >> `rpc` sub-module, and update their users to reference them from
> >> >> their new location.
> >> >> 
> >> >> This is a pure move commit, with no functional change intended.
> >> >>     
> >> >
> >> > Hi Alex:
> >> >
> >> > What would be the plan for commands.rs in the future after the
> >> > movement? I was adopting the similar code structures
> >> > (fw.rs/command.rs) for vGPU manager's RPCs and GSP plugin RPCs,
> >> > e.g. having RPC typed code and function handler(wrapper)s, it
> >> > would be nice that I can align with the idea accordingly.    
> >> 
> >> Can you point me to the the structure you have if it is posted?
> >> (sorry, too many series in-flight and I cannot find where it is
> >> ^_^;) 
> >
> > No worry.
> >
> > I am trying to maintain vGPU-related RPCs and GSP plugin RPCs in
> > below two files. Basically the maintaining schema is similar to
> > current nova-core fw.rs and commands.rs. 
> >
> > IMO, nova-core and vGPU managers bindings should stay together, but
> > there can be quite many vGPU RPCs. Would it be a good idea to
> > maintain them together with nova-core's fw.rs and commands.rs?  
> 
> Unless there is a good reason not to do so, I'd put all vGPU commands
> into their own submodule. This makes it easier to e.g. create a
> version of the driver without vGPU support, which I feel like we may
> end up putting behind a Kconfig option since it won't be relevant to
> consumer-grade GPUs.
> 
> Bindings are a different story, they are generated in one go and
> unused ones are just optimized away, so having them all in the same
> file is fine.
> 

I see. Thanks for the clarification. This is the exact direction in my
current code. We can plan more on the detailed parts when you are
reviewing my patches. :)
