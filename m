Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012016.outbound.protection.outlook.com [40.93.195.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3373B9DAC
	for <nova-gpu@lists.linux.dev>; Wed, 17 Jun 2026 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781682694; cv=fail; b=BoY9ImC29aL0Luzhk1UAFwOQDHRvJOer6PEafgN0bANURCwNqnS2zMTbIkV8b4fCf5ivOQVC/8UjVPTWvLdGRaGCs5e7ik563QDGyASB3+6LIoINuZ4uTTSZ1mNjgSFURz9rkWNLeL8/6gFdYzKmM/PdxkJ4AeiVnXY7GS8FaSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781682694; c=relaxed/simple;
	bh=qQaFwp8p2HypnFtM4w34f7b2+XNTJUMYH8QNM/N+IPU=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qasizwq2wsNDiRAwGeJNPFswhLALya48E704MXqjOMYC/HdHRNKXkVdV0SUH0/GeSFQWo5WKZGAoySRlcGiUdqw0/C3qz+RwRCwIsFfI0YDGIUuOjBwUoatiXdXIXrUXuE9Z56RFvLQfxgNxOSHS1KLN/umzoMog4M4bgPf5rUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i71ZEguR; arc=fail smtp.client-ip=40.93.195.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i71ZEguR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfrCNsLz7+e0LGKVYbpMjyuyULITQyyl+rmVeXTuITqH2stLOJBVRMFpkuTu5g8g4Y8Yz+67nV0ApUGLo1g2TEosoIdRLaPe211iqGedG2ZKfdxYsbbV9lg1+uSeODSSLzPfN6UJhobfv8xTYkN5ETQWehH7JfcEspZ0x4YtyyuBBa/Zr20U3wjLuZLDyDWsPRr5+HcXfq9uSAxfhjw9xFdTjiVs3ii4T+2dg7yc11ptTqp4VMap+f/NvQP2kME6FkFkZ0rAg/TZJC+IPGkzM4k5YQvpd0rUzhA6NeDa6ehg3GJ+TFGk6vLSV6+SRuHmmINx+c+GiH3Fum/wKym6uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNxuMjrwcidqBkpoKRuehsdzxWcQtjonkM5/P1h152w=;
 b=ASyY7jzNKNOagBQYsxpF2kRsmBWw7RixmaD5ti03eFBkNCYHu2bFXlBZ21oq50SF3nD6pWaP9qESufi5T2rX53lmlNBFs0OCnOY/pFN7Msfh2ql7dAyfEBHOywv7y/T13ACg3bPWvjY+s8Y2HmCyYthcj69+ZVeVpQlQ2GHriUQPtSwsVIhB+Enrv+1AfeOJovMQSYXjiP/0dGsTVT4BD4MHw7lpfM52YE6SafiUDrtO6PtsBLNeFGuGIUCt9dIkstEr/hvA3GewhfZZxYhIaqQ//nQO28satek1aOqmL6cYl93mEjVpXU5fKltOy/rHE7F2ChqLzjwyKxB/XLrFBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNxuMjrwcidqBkpoKRuehsdzxWcQtjonkM5/P1h152w=;
 b=i71ZEguRZ/McO4siSusGzCpfBewtNX879lwOrcJNfnHvoRfYj4n/ND9Xj6302iWfFjvTR17a+0a6KMUxiBbDcDsr0gt/t6/u2KaqbCl1LJiquzi0dKjgN5/Tdv6Xx9mOOaqwY2fjLWVqI+IL2MAcxIXsX/hdrgemgHjb5kg8RIz6GdupjlB78XJbdVNI8naFs0YO2MMtbC01z4uZIag/42DAw001Tg6L9EqlAPTf20Kk5M3xblZKV5Mm9sMXlzQo/5ZAPNJVxXbXvR8KHtU6h2Te6DdMRGdqPtndOfK0x23s/xVMxZtJghSoK0M+VNGmQURznii9auOOdxm2X/s0Qw==
Received: from PH8PR07CA0045.namprd07.prod.outlook.com (2603:10b6:510:2cf::14)
 by DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Wed, 17 Jun 2026 07:51:25 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:510:2cf:cafe::9e) by PH8PR07CA0045.outlook.office365.com
 (2603:10b6:510:2cf::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Wed,
 17 Jun 2026 07:51:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 07:51:24 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Jun
 2026 00:51:15 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 17 Jun 2026 00:51:15 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Jun 2026 00:51:08 -0700
Date: Wed, 17 Jun 2026 10:51:06 +0300
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
Subject: Re: [PATCH 5/9] gpu: nova-core: add FSP and PRC protocol
 documentation
Message-ID: <20260617105106.5fceaf8a@inno-dell>
In-Reply-To: <DJABQBFVXDZW.T9Z7B76WVMXL@nvidia.com>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
	<20260604114339.1565660-6-zhiw@nvidia.com>
	<DJABQBFVXDZW.T9Z7B76WVMXL@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|DM4PR12MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed3bebf-f381-44ba-ac4b-08decc453b0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|36860700016|1800799024|82310400026|56012099006|11063799006|6133799003|22082099003|18002099003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	JfkJ58f3d+uIgXIvDDba0gedqH/lhnmXsSD5VSccslfC2PecDgrbQaDA096Rtm3WaMCLjloxG0PFblfBbzxhChbFiTTX6UtG6fj0LpemQJhEW/bRCqPnFnQSJS2ohsE1laqlwboiloqd36qGYFM6UTjlb72SxSLS4hmmbfV0FY7VzW4PjgxZMNkwzMyY0sZMYXx4MRlVQ+tXsiDgUML9FLclRMdw1gosWXax2E86w/OfcLroan/aEk0pLneG89wGD6huj06l1wsDnIF0MR+DSe2nnV4rlORLbzqvrwG8uyol38kCrOwkm0G1N37KmNNhLbVHZeBEWIs6M42GcynsUyPKlyaWubiCs/R+wXtrIrmNTHI5EVisJax01ULB8P7RundiGS8b5wp8Axk8+7IXgHi7SHGmeEhr88KWDxndhjjowZlyPoWLiYcj1W/aDPj1ftOjjadvRAeUBXAN/S+T6y/fzAX0ByOBx10DZlTCjA+AZ2oTwCJnMPo8I/fchT627+sAIiLVuMwR3gI8HELcCOJIUNw8L4/9WcOUdbbWC1gRg+uBQ3bdRIPsMPiD23iMVIVUGrjeWporq10WCc88mSGFPyIgEvQS2KVDIuXFOK8t9MUQYOWaZFQNNC0nyciEiLv4Hb2bHSoIq4H0h0jtlaUlOGif02uNbNPV5ONSyLsMciVNl4ve+coagCM49j9QTAkoa7gxOEssNY03MXoZL9boQR9cVRTuZgeB9o5xdZA=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(36860700016)(1800799024)(82310400026)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ARUAcSu/2qSAcLvWTDPyxsm7hUQPmGOcA00kX3qhXY1rA+INRuLE7Dj0iah2mMfVJAo24gGUc1iFjEXyeyVu5rzQI9N1AbXSh3QaQKTtMKCow6YHxsIFa6DtajsF775OkpZ0tgk9q+xm791MeKxV4hbgQlZL3iodVbBqze8J0xEcaIxyPbWf5RLkPiywWGV8XH+dVkSnp9/ZMwX3Qa0BWamFhu+YRoehK527YY1/F7k3svAEaZ/3vZyX2s0kMUuVPPI7iMV5K0jDntTRp45DzmS3NkoA/fcj+kgOZ+Puz/uxHIOZ8QUwkHuXkyX8kdyRJNLifZzdRCOUG8QoDNrUgJht5uU3G/2tXEliUgcHsPEjvP7ma1nXquvoEAW0DvKgmgYbA7iD3GJ/pdVa+hDL5kZ+71ZXK8K2vSGmfwyVfeKLzDLeOxePLA1722GbaWH6
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 07:51:24.7615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed3bebf-f381-44ba-ac4b-08decc453b0f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6448

On Tue, 16 Jun 2026 17:17:34 +0900
"Alexandre Courbot" <acourbot@nvidia.com> wrote:

> On Thu Jun 4, 2026 at 8:43 PM JST, Zhi Wang wrote:
> > Add documentation for the Foundation Security Processor (FSP)
> > interface covering the simplified Hopper/Blackwell boot flow, the
> > Chain of Trust (COT) message protocol, the MCTP/NVDM message
> > format, and the Product Reconfiguration Control (PRC) protocol used
> > to query device configuration knobs such as vGPU mode.
> >
> > Signed-off-by: Zhi Wang <zhiw@nvidia.com>  
> 
> This is super useful, thanks! One question below:
> 
> > ---
> >  Documentation/gpu/nova/core/fsp.rst | 142
> > ++++++++++++++++++++++++++++ Documentation/gpu/nova/index.rst    |
> >  1 + 2 files changed, 143 insertions(+)
> >  create mode 100644 Documentation/gpu/nova/core/fsp.rst
> >
> > diff --git a/Documentation/gpu/nova/core/fsp.rst
> > b/Documentation/gpu/nova/core/fsp.rst new file mode 100644
> > index 000000000000..52d618d22bb8
> > --- /dev/null
> > +++ b/Documentation/gpu/nova/core/fsp.rst
> > @@ -0,0 +1,142 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +===================================================
> > +FSP (Foundation Security Processor) and Secure Boot
> > +===================================================
> > +This document describes the role of the FSP in the GPU boot
> > sequence on +Hopper and Blackwell GPUs, and how it differs from the
> > earlier Ampere boot +flow. It also provides a brief overview of the
> > PRC (Product Reconfiguration +Control) protocol used to query
> > device configuration through FSP. As with +other documents in this
> > directory, the information is subject to change and +is intended to
> > help developers understand the corresponding kernel code. +
> > +What is FSP?
> > +============
> > +The Foundation Security Processor (FSP) is the GPU's Internal Root
> > of Trust +(IROT). It is a dedicated security processor that boots
> > from immutable ROM +(Boot ROM) inside the GPU and is responsible
> > for establishing the Chain of +Trust before any other firmware is
> > allowed to run. +
> > +FSP runs independently of the host CPU and starts executing as
> > soon as the +GPU is powered on. By the time the nova-core driver is
> > loaded, FSP has +already completed its own secure boot and is ready
> > to accept commands from +the driver.
> > +
> > +Simplified boot flow (Hopper/Blackwell)
> > +=======================================
> > +Starting with Hopper, the boot flow is significantly simplified
> > compared to +earlier GPU generations like Ampere.
> > +
> > +On an **Ampere** GPU, the boot verification chain involves
> > multiple Falcon +engines and multiple ucode stages (see falcon.rst
> > for details):: +
> > +     Hardware BROM (SEC2)  
> 
> Is this referring to FWSEC-FRTS? If so, should this be `GSP` instead
> of `SEC2`?

Hi Alex:

This refers to the BootROM in the SEC2 Peregrine. From the timeline
perspective, FWSEC-FRTS should be positioned as below. I was thinking to
show the brief differences of relationship between internal processors
so I omit the FWSEC-FRTS in the sequence. Do you think we should add it?

+     Hardware BROM (SEC2)
                    here  < ----- FWSEC-FRTS (GSP)
+          -> HS Booter (SEC2)
+               -> LS GSP-RM (GSP)

Z.
