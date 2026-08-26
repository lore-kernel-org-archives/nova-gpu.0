Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010004.outbound.protection.outlook.com [52.101.46.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D583A5422
	for <nova-gpu@lists.linux.dev>; Wed, 26 Aug 2026 08:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732080; cv=fail; b=igAZzEOgY1B2dQlzRtRdVWq60epUf9ddraFz2LEl54uXOi5nkHyZA6A5Q2Y8AT4CLsKe0hczfd8pbUo0lXC183RfBZc6PJ/Im9rdi7hcsJwiIC/JLQ4c9fQm4/kxtoPPkXFy69XslDSP4U5byZNrqovMaD33c8MmhgT0mvDW3+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732080; c=relaxed/simple;
	bh=bi+UpX/1XJRGa77iZHPhJx9hJqwmMHL+oTfpGSMFKyw=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G8cZwNsRpAdEPS+opK5JNDJ9n01GBZCt/A7d+756Gj2RJhE37XPis1mQTHCIh7tVzLG46sWpo6accekwTWMFqkOaCsjLp/A7uQcIGJDaJEl+Yfm+jKco0YX6GUzrHUZGNDgGne36Vj7G+mxiRW1dP5YpM5lw9PxVbrvFTsWJ6As=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NKsZLyj4; arc=fail smtp.client-ip=52.101.46.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NKsZLyj4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fw+1a2q3/XE5a+H9Whtfp3V30dUrqpTLcAqaPK8ng8srq0XXm2GVSsbWNmehnZGwju0Rs0LS8eUC/WLPyfJRaz2Nr2tP0mGlenAKjKkM/xO5n73AKCJmQtR8kMS4Y/ReI3/TACk+fkqbzn5/KoWe82K1foQ9x1PxSG5yQ2674nL6iCHIv0E1r62otc6+GnFct9H6+vatySbLBOsLp/BrJRFGvLE8ENNwMIHh8V9xkdRjKi1+jNcTrY4XPRPxfXNiflmiYF59gwZHcvBDwZu3S9w9BLvEbE2qW9F7CfJaXxkfBqTf/1oyacK8/HC8rARzbFp7PaFwT9zcTbrWqr+hqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bRGjuXSfLRN4WscMkBgxcE33b1H//MMYzmsAXd9sxY=;
 b=TN3w2h2HsNiZUGCzolSdB+14Qsb31Efd56kzqm6rLolcaq9F15yFnCAfIsAiQE5vyK5rtrqlHDvCuHV+57bwnSk2YgIdJbSFfNLPwDsVNg3gXUcRmlEWY5KwOLWnJzO2lcpRHWSv2CwP90nHtkmkt13JNZAJfDMMPVnKGfJVs+vt01PEZdm5X3YDU/3Htg5gBZ66Y4LRqSj8/SpmvgTOcieppLwOVzwaFei++9x1gZ0dA2Bp01U6t/CjW0J77ExhIlLGlVPff3CmZp26/wDlfcMH+MguOSdITSKTtZoNLzUTaevlkdeA/AIQXxLSHJdLj4uFc/eGbDttdpXchlStjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bRGjuXSfLRN4WscMkBgxcE33b1H//MMYzmsAXd9sxY=;
 b=NKsZLyj4V/j/Nde70ZuiQrWgYX9fX/TXMZB/MtrPys1RcSVDk2mrEb6P/ns41jWk8Bk3E8lwnG9W2EPHaA7WAof+4cWIeMYNajz0GbvcpSnJ17Jszq1ZtNVFRsiPwvUfMhE1aAktLkW54ufdH4Maz6W0X5HXmmiMBB6cKLw527GRi4cqb0kito6C6/oDavy4DiUlCFA6KPexh75B01gLENQ3wzVyESr1aX/gEy3TRZEciGaLNwKLzdbNp8/hkMtmtZtMOSE2gqJqvuynvEIdjSU3iO68nQXVfPPW6pRJWosTMd7WPFAcZv6Z4+j8Tw+/WymLkkHR/sR5fMbDplkBXA==
Received: from CY5PR15CA0107.namprd15.prod.outlook.com (2603:10b6:930:7::16)
 by CHAPR12MB999250.namprd12.prod.outlook.com (2603:10b6:610:300::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Wed, 26 Aug
 2026 08:14:32 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:930:7:cafe::29) by CY5PR15CA0107.outlook.office365.com
 (2603:10b6:930:7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Wed,
 26 Aug 2026 08:14:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 08:14:32 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 26 Aug
 2026 01:14:14 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 26 Aug
 2026 01:14:14 -0700
Received: from inno-dell (10.127.8.12) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Wed, 26 Aug 2026 01:14:10 -0700
Date: Wed, 26 Aug 2026 11:14:08 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, "Benno
 Lossin" <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, John Hubbard
	<jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi
	<ttabi@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
	<nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: fix incorrect naming/framing of GSP-FMC
 firmware
Message-ID: <20260826111408.34d47a7d@inno-dell>
In-Reply-To: <DKYA3P4E2CRC.3NVNCJ42J2FRN@kernel.org>
References: <20260825-gsp-fmc-rename-v1-1-f82526f01d7d@nvidia.com>
	<DKYA3P4E2CRC.3NVNCJ42J2FRN@kernel.org>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|CHAPR12MB999250:EE_
X-MS-Office365-Filtering-Correlation-Id: 7408d107-e584-4008-a48c-08df034a0f14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|6133799003|3023799007|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S+OTnCZi0nvxkw9ss2AjjdQDGLS8lTy4rcouHwtJcODoQxqtHWrLTGL6lJk88/5+wM4yntBW+cIl3LAnOtQVkaNOcuzjz7YlNKspxFI5HvhodaEvVw3B9H+jF3/D4tqdlgG2lwsArqshhL9Af7Nkc5NbDLLlu1AWG7z94sYTXEkfThroskzh4RBE95CNVPrF64SMaJQhb7IN2vthhVx3yDSPrFLcnU2EsDNc5y/9i1IIdafVThVfL1sz1mQ9U1l4M6d3TJtTNibPaLPnFHkKzFlPs86SzS7DAgTYQ1UtiJWME0/D4nkuaNoDl9p/sZqejXehHII0u94FzS/IqbETSGi1QfhwBfMGiSdagivaItV1xE7eFhzfmQyn30AW62emrIptc7Iw4qkrKStQmga32FimHZJKwsgno1TFYy5LPE5M7Y1aZ6fJahzD+xe+lVk5+Dsby1gedKf/1BZcgMdcxWRqtbpefcgtBFBBfZ1M2SPAjNXL87B+bWzaP0VGKCcsOD0y5/JGr7s8JVSQnn6e0iql09nqaHaoQ/W6+sROFkxCOwyA1b4wlwZ/kztUOhJisbWE4A+MA8nQof/dqMSI1ZAk9sq23hpG3MlqViZ3siLEj8kiRCsZ96xAdLKl2anI/uY/0gzbVXl21CK5MlqyUy+c8RujHJ+XefjkRqSvARjN8DUm1q6DMYUZ811rjK+w4MCCi9rL+YZa4Ux8vh4bww==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OST8FADfmpetA9TiUAOrR1vuDLqqcGrJlcH6t9xbcmB6FbxsYYWPNr1ltdLAiBIPRz0v+9zUcfWhVFqx5gyY/X8qY5V4cJdiO37BRNkvV0QIZh9/NKVdIfw7y76XoztGhVZuuEWI9ksbQoC1gt5m3kJS6VaE3Rft8FzPhVpaEmiqjXP5Z/E/dTL1bYA9aJ55pUK0NjoTAD4IAnfAO+G5DiTyhS6G2pHedS2XN4vvoYKd2neMQAF7jUKPgeVApQ3N0vLWKCjF8LirUBto+M7uoCtIfqf2+S+Fcl7RGN4YkuEt5v+vxfajGTW5WOOmfPvRCH5QhJOa3yM8ZJGw5BI1mR7vLPn2SmIWNL+JcphBd+Gdams3ImArVGnbBPhZfcnC64gPydcASEBpzOuv3vSpPSrJ6gsOSR0dwbXZ5RlnvXR6NvbJKChpIJ304oKa4EM+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 08:14:32.4199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7408d107-e584-4008-a48c-08df034a0f14
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR12MB999250

On Tue, 25 Aug 2026 21:40:58 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Tue Aug 25, 2026 at 10:31 AM CEST, Alexandre Courbot wrote:
> > The GSP-FMC firmware code lived in `firmware/fsp.rs` and described
> > itself as running on the FSP. This is incorrect: GSP-FMC is loaded
> > by the FSP, but runs on the GSP as the loader and verifier of
> > GSP-RM. FSP secure-boots on its own before the driver even starts.
> >
> > Correct the naming and files used to contain the GSP-FMC code, by:
> >
> > - Renaming `firmware/fsp.rs` to `firmware/gsp_fmc.rs` (as GSP-FMC
> > is not the FSP firmware),
> > - Changing the prefix of some declarations in that file to `FMC` or
> >   `GspFmc` (interestingly some were already correct),
> > - Fixing a mismatch (FMC means "First Mutable Code") in `fsp.rst`.
> 
> Good catch,
> 
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> 
> >       FSP (hardware root of trust, boots from ROM)
> > -          -> FMC (Falcon Microcontroller, verified by FSP)
> > +          -> FMC (First Mutable Code, verified by FSP)
> 
> That reminds me that I'd like to have a table in
> Documentation/gpu/nova/ listing and explaining all abbreviations.
> 

Thanks for catching this. I got this abbreviation from other patch
comments.

> In nouveau it's a huge mess and all the abbreviations became rather
> confusing.
> 

...

> We already have something is fsp.rst, but I think it is misleading
> and needs to be fixed as well.
> 

I just dig some docs, there are multiple FMCs for different
controllers, here should be GSP-FMC as well.

Alex, you can include the following diff for fixing the chart.

Moving forward, let me go through the fsp.rst and check with some docs
besides other patch comments as the source.

diff --git a/Documentation/gpu/nova/core/fsp.rst
b/Documentation/gpu/nova/core/fsp.rst index 52d618d22bb8..cddaafe69e6b
100644 --- a/Documentation/gpu/nova/core/fsp.rst
+++ b/Documentation/gpu/nova/core/fsp.rst
@@ -79,22 +79,23 @@ GSP-RM.
 
 The message flow is::
 
-     nova-core                          FSP
-        |                                |
-        |  1. Poll scratch register      |
-        |  (wait for FSP boot complete)  |
-        |                                |
-        |  2. COT message  ------------> |
-        |     (FMC addr, signatures,     |
-        |      boot params)              |
-        |                                |
-        |                                |--- Verify FMC signature
-        |                                |--- Boot FMC
-        |                                |--- FMC loads GSP-RM
-        |                                |
-        |  3. COT response <------------ |
-        |     (success/error)            |
-        |                                |
+     nova-core                          FSP                         GSP
+        |                                |                           |
+        |  1. Poll scratch register      |                           |
+        |  (wait for FSP boot complete)  |                           |
+        |                                |                           |
+        |  2. COT message  ------------> |                           |
+        |     (GSP-FMC addr, signatures, |                           |
+        |      boot params)              |                           |
+        |                                |                           |
+        |                                |--- Verify GSP-FMC         |
+        |                                |    signature              |
+        |                                |                           |
+        |                                |--- Trigger GSP-FMC boot ->|
+        |  3. COT response <------------ |
|--- GSP-FMC verifies
+        |     (command status only;      |                           |
   and starts GSP-RM
+        |      not GSP-ready)            |                           |
+        |                                |                           |
 
 FSP message format
 ==================


> 	nova-core                          FSP
> 	   |                                |
> 	   |  1. Poll scratch register      |
> 	   |  (wait for FSP boot complete)  |
> 	   |                                |
> 	   |  2. COT message  ------------> |
> 	   |     (FMC addr, signatures,     |
> 	   |      boot params)              |
> 	   |                                |
> 	   |                                |--- Verify FMC signature
> 	   |                                |--- Boot FMC
> 	   |                                |--- FMC loads GSP-RM
> 	   |                                |
> 	   |  3. COT response <------------ |
> 	   |     (success/error)            |
> 	   |                                |
> 
> This reads as if FMC runs on FSP and FMC (running on the FSP)
> subsequently loads GSP-RM. Maybe it should be fixed by this patch, as
> it is the exact same mistake this patch addresses.
> 

