Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011051.outbound.protection.outlook.com [52.101.52.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573F63E9C2B
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372315; cv=fail; b=FPfGY2bjdny9a4tl97CA/gwxxbQxB9y2wodWPQOrSwdSfekwlNM4rhnif1uR/C9/6EDp44VpJU5LEokZ7KPXRE5ZMAye2OJIaPMxGYjYphVQjFMvq6QiJVtW044Coj4iqXzs0HFAMVPS+nmXVkeaXTBDN9kvwcToareP/0U9gjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372315; c=relaxed/simple;
	bh=B5jUQdwwZdwBfdNeTd04DFccoLDMOmnW8CF34bM0Jto=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S5l2S0BHQOhCklO6c+ozvyZLdKvHh+2lloC/cQwpKtCwgOgYcuj2ASQ1Da+YJlQJ4X8QiCTcql2wesn3zrDOK1ofNGuEgZVxL+ODqALHj5hvGxwt2OOUaJBa2FXmDzK9InFoxDUcfhk1gUp5guqaJlcq79RsspJSj0whMaw6K6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WLdqy4Hb; arc=fail smtp.client-ip=52.101.52.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WLdqy4Hb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTYMOTiUgc29olWoleKTHPFhxiPtFtJG06DP3pS6ct6jDlSc+iriemzA9xjJ6ixt1TpxFtLB14iSP24+5CwStHjIsOIVCWUvHy0EwbsGs0uWCpNiKIHvorOaDIUwEvEwErm3jhvJpUx7dBIR+WWR9rNGea4YgAQJ5TLSizBNJFK0a4LaegZnMRvjh2euezijOVGsyQg2scPaSRsJ3GeQKRU+KNnjYlc39Wv1nWdz5vsBiROsuDTJWppcnDyNaxWGjcSxHcWHTLr6n7E91UbtIyyvfGEjjqMEn5sGuI3ay2Xazi83tSRyEXHwf82aCTm3kPaFHn+YAFUKoV4yjrt8rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOOferCbyywN11EFSmliw7Z4NRIMnNsPDTzVMlNmreM=;
 b=rWC6iiVOIAO/nxiIVWHZhHafehW7l1+ehqQsSB3s5RZIk/Guz6evGmH6R6WsjCwdtC6bdiFAaGcADkIjef1hz/vpgjQ9IB41++0CvMHM0qrFIdWl1szKSAy2wThvrk8b7MPW/+Aa+c0vvZL/YHfNZBzcDWS4dJE036eyWfsa4jg52eI6nzm+FzI+3UPL9G0KWU2MQy3qnnYjrF51TeC7AabkBmUhir1EKSC7VnBCqedjJaM/RTmKA98j8InlB5iBvSUNUjkECRdVR+rfYO3+rhILnnPCHnzwOwZB3s0F4yahMMl120/fmBcAbibuRJPPmCF2ZgfBaqzCaiGqSPVjew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOOferCbyywN11EFSmliw7Z4NRIMnNsPDTzVMlNmreM=;
 b=WLdqy4HbczcwF2B1lCkVaPneMS09eUDXQNy+i1DQW8Y9IDjxFOnC6T8sGeudVy2m+nrSWgpgEmya0vk/dmWxmnogRX3erk59PITiYSTYAkxhCLPsnfIFmnIYJXbuve8YwCi6P+dUW6pO0C/jsCLLr1w2fl2xCVtEzeOFrqe4w7CK3DbLqFzBR0TA7IV4lRkUJc8c5+CHQYNFaQfjuaQipnytGvCBRNLNAIn6IOvUAPUkjb4E+C/lEBnlZIH+fIn8Wz/3Y5Npt2M0KaC9fmItl+i+6gdY0UNbuveCbmIGR46boD1CaOVT49BzVIkMH3rkPyY7YY5P0qRDwqHd16HQ3w==
Received: from BN9PR03CA0356.namprd03.prod.outlook.com (2603:10b6:408:f6::31)
 by DS7PR12MB8250.namprd12.prod.outlook.com (2603:10b6:8:db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Mon, 14 Sep
 2026 07:51:46 +0000
Received: from BN2PEPF0000A893.namprd04.prod.outlook.com
 (2603:10b6:408:f6:cafe::29) by BN9PR03CA0356.outlook.office365.com
 (2603:10b6:408:f6::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:51:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000A893.mail.protection.outlook.com (10.167.248.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:51:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 00:51:26 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:51:26 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:51:18 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <dakr@kernel.org>, <acourbot@nvidia.com>
CC: <alex@shazbot.org>, <jgg@nvidia.com>, <yishaih@nvidia.com>,
	<skolothumtho@nvidia.com>, <kevin.tian@intel.com>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
	<boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
	<lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
	<tmgross@umich.edu>, <jhubbard@nvidia.com>, <ecourtney@nvidia.com>,
	<cjia@nvidia.com>, <smitra@nvidia.com>, <kjaju@nvidia.com>,
	<alkumar@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
	<kwankhede@nvidia.com>, <targupta@nvidia.com>, <nova-gpu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <zhiwang@kernel.org>, Zhi Wang
	<zhiw@nvidia.com>
Subject: [PATCH v2 15/32] gpu: nova-core: gsp: add status-only GMC transactions
Date: Mon, 14 Sep 2026 10:48:50 +0300
Message-ID: <20260914074907.1399629-16-zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914074907.1399629-1-zhiw@nvidia.com>
References: <20260914074907.1399629-1-zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A893:EE_|DS7PR12MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: f5846086-ddcc-455b-7ca9-08df123506c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700016|23010399003|18002099003|22082099003|5023799004|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	SrcSdMt4RrerJ2T3zXT2hy4E5CmBfrVA9Ryxkw4Vsss4pwohKRmwGQDaVW12a7pZ6Nbu4HmCafS3jhEXv+rUfx7Rzq0fbu2PbMVfMRIJKIyFw3wNbseO2LOq9MhHkHtksvN4KwJZPWgjlIUkfeodH+W80pHKXl0LuqpY548qGPGWvpAbSwZz94dPmkD0LmUxk7JjWSkZaGYdzQHv36eCYvdZmkB8MfW8ttEcYOm+ad6k58Yve3hh1kKJYzDGKebWnE9+fMiY2PpdlJ8geDHff8lznuAcLvnMae0dMbrLXMqdZnfFvQz/kNPy4Wi6th6MZiUhU5R4/7bGu21Rg2G2ZMXC6+tR8Hhhoynj2nKD/j3YOQAro2QfzgHEmCktKUq7s1CrxpKo2THnPcW3Tmx636NEWWMqSkCIEnOUXvnALO/6g5p0ThjLDcRe73ieGayFzeS3ew5FZXKoB9fhs03zRS0yApzIMV3Y3OK+4S3iNBTtBbN/poyUBUil/j56rOHSDYeRuEXvwWqtLs8CVNbFxr2LOVLzbODKt48R6nWSiP/SGo++BByiNE94Wl2Ku39uC5ex7P7m36tQ/9skNoZypZY0fAGQpKEnILpDkzig7TtRuc9xW5KZzTPzl669jvc07AFUY1ncNp0DoLPvr1HAgZiThQ+qG9JepOhiXjLml6Bbt+2RLP3HJkq5jIv5GRoGiQJJ+hk/SWM5Z7ro2BmBtg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700016)(23010399003)(18002099003)(22082099003)(5023799004)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ccMJnziBzPcw139K1fgWk0GZrRkUWDsBOvMed6FHrvi0LC9tF9XLSZr1YJMlI9Bk+YlrLPFbHpe2QtskhYMSSy7VEt1PCNsydftUHhXVvC5/2PcK2AUB7QlP7aBBmmrRbLop5oKV2u6hAWYkvgIWsP6Sq1OirhHN/nAZcwedBr1ozbrzwcdB49RRFk8EtWrwYrXD0+L1Y5Z+qAODPqbZTuJg4Oxgq1jgzrDQ1LDBHcp4tRXuoKGxJD5ilwS5AKwXxSu/8LWSMX188aJgztMLvZDlaZ3Gf/X2C9SC8snyadVMn2UCm4OVMMpm01TiUagN9Dt6/ULVqDhe9xGc4O6PmSHB0eQ4tMOWBeP/ihqnOt8DbZubOxKugTpKoJLb2kBeTXicxdLRpJqJWRjamliF4VIQvBtqZZzITXn8fkmW01rh1KOK/SPhm39zCembxWmx
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:51:46.4475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5846086-ddcc-455b-7ca9-08df123506c8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A893.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8250

GMC operations such as GSP plugin resource cleanup have no response
payload, but still report success or failure in the response header.

Add a helper that waits for the matching response with a zero payload
limit and converts a nonzero firmware status to EIO.

Co-developed-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 9fb17e576eb8..891dec5c108a 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -503,7 +503,6 @@ pub(crate) enum QueuePointers {
 /// Response from a GMC API command.
 pub(crate) struct GmcResponse {
     /// Response status (`NV_STATUS` code). Zero means success.
-    #[expect(dead_code)]
     pub(crate) status: u32,
     /// Response payload copied out of the message queue.
     #[expect(dead_code)]
@@ -652,7 +651,6 @@ pub(crate) fn send_gmc_no_wait(
     ///
     /// The queue stays locked for the complete transaction. A single deadline bounds all queue
     /// elements observed while waiting.
-    #[expect(dead_code)]
     pub(crate) fn send_gmc_and_receive(
         &self,
         command_id: u32,
@@ -736,6 +734,17 @@ pub(crate) fn send_gmc_and_receive_timeout(
         }
     }
 
+    /// Sends a synchronous GMC command and checks its status-only reply.
+    #[expect(dead_code)]
+    pub(crate) fn send_gmc_and_check_status(&self, command_id: u32, payload: &[u8]) -> Result {
+        let response = self.send_gmc_and_receive(command_id, payload, 0)?;
+        if response.status == 0 {
+            Ok(())
+        } else {
+            Err(EIO)
+        }
+    }
+
     /// Waits for an unsolicited GSP event of type `M`, consuming any other event that arrives
     /// first.
     ///
