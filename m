Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011004.outbound.protection.outlook.com [40.93.194.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E57E403EA5
	for <nova-gpu@lists.linux.dev>; Mon, 14 Sep 2026 07:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372323; cv=fail; b=cOgCWAh9qco6J0KUcJ73yrZevXnNhCLOCaxJ9DyQvKzogrb7v+3LIc7/oE5REyUKrmEA3c5RhXS0IWqu6zSs7yj0w/P0B5fav8SP2qSqwBkMXGVtSMRmf3HR6Sx6GsmSnV7Rajyn7hHCFTliGCSvXykhMpUQbCw4ztF807Ve+As=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372323; c=relaxed/simple;
	bh=Y7FeIw9o7gBU6x3fc7mvniCbdvBp+y/F9OD5T/xsT7s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uALm2DLc3PwPP6pSIcvC7kp9ysXWcp8ZXRFv6Sbf8MSyC2v1pFGs51qZn/LaQnKlIY6riPXOc/RXqYdOThRNYtPNeL4iBrIymXqm7YI2+8tInMxhkOVmuIg++Nm/va8xDHzOWCNTdISj1oCRV6lIbhW9t3HGQnvH+w7HZURI4rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cyA0ZiLN; arc=fail smtp.client-ip=40.93.194.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cyA0ZiLN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhAFJbWD4KVNaKfBnkEcIhGEOzTJxEhFVOf8vVd6J3mL8KzSAh7H13SlMzzL+RIxQlTgG0DUIYD843KpWB6Sk/7S+PsqTt59ubCDCHB7t3IjoTLAVO7h7wNg0Zv6Dgzmnnbo0qXFLjvGBWd+nI2gLsz179bi86dUsViMf9V+Uok6mgUfE/nsdDEIb3chzBoi7rAyLrVOicQgkWIwaSJs5zcWg4VKynRvn17XUWX9w6FxMVt8hIfybNGynPNwSjJYdlfxagUhKTpWiyT1gDSCkrFztKNXyANX1fJ05gnOkAu1KZDYYhkQrmr2LYMQA/UUxPpyP8xwS4WZ6OFJLvPm8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJTv6hLBephCThZU77UsAid3LOEPwk5LHzSV4ikACfs=;
 b=jdOjCzXy+Fde6rTUG4uaa2H+RIXdqEfhd4w0rSt4hRszPGJwjEZJT0WfLbJu9DzCE2lSvDCy51fKT6sb8ZrEkESkfkCgnoFrZmTB5ydXz9tlZt1jNdS47u9cF54mDdbYwVKMnCwBDIvLqhfsacsEo//K3ohiEU3aVFxdBywpCj8Xx3j31x25XBLoQYeD0fwjWFUNEBPVswi0WeqcACN9FQwZBiRi4+4D1Xrc2Wf/mPzvqXBhMi2+3kNHBN8qqoG8e3VZE4d+/D6lk+rGGcpVwmSjUmmmLIG1gC2z+3sunLbZAJ01jl34JDZbE0/8BhGwLiXD+iykRTiV8Gcg6vc5PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJTv6hLBephCThZU77UsAid3LOEPwk5LHzSV4ikACfs=;
 b=cyA0ZiLN+xCENvc4uM47bIGezdHJJXfLQz3T13kTv/VAdCO+nGvebQaUYkt/bPOMK7v0yQLfu+luD5aTOy4QxN1NdcQkAkKtqbIieJnu2W3gnRQk7W3BwQKapmsrMdd2DkxO4ZLfeWXtrY4ElcG7BfvuDkSqrespVqkFyW/PicPAt03tymYM6C9zUiB3ej/YI0/7+UseL5hLRJ1OIYL7qhfBLHa+KBKYQ42jcDakqqX5xoT8vicq1SU+I0pcCBxtmOnLEHM3MNuJYKl/1x20zd2feiMuns0uyKA3BvYpUSk1ALfp1AY+xkUIZIfogff3Gn1Zm9Cw39IeYtiz+ixkdg==
Received: from BN9PR03CA0880.namprd03.prod.outlook.com (2603:10b6:408:13c::15)
 by DS0PR12MB8019.namprd12.prod.outlook.com (2603:10b6:8:14e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 07:51:53 +0000
Received: from BN1PEPF00018549.namprd05.prod.outlook.com
 (2603:10b6:408:13c:cafe::7f) by BN9PR03CA0880.outlook.office365.com
 (2603:10b6:408:13c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 07:51:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00018549.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 07:51:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:51:35 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 14 Sep
 2026 00:51:34 -0700
Received: from inno-dell.home (10.127.8.11) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Mon, 14
 Sep 2026 00:51:26 -0700
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
Subject: [PATCH v2 16/32] gpu: nova-core: gsp: wait for GMC completion events
Date: Mon, 14 Sep 2026 10:48:51 +0300
Message-ID: <20260914074907.1399629-17-zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018549:EE_|DS0PR12MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 48c065e2-8102-4e0a-fc10-08df12350a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|30052699003|7416014|376014|23010399003|1800799024|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	v4ldZbDIX2t6/ycW5JxoYqRULxHvuuverAWH1MN0+GXTBaPwPPep9Xk+aMr6oFmvcjM9fWKFxNBqTn403jqaB3smBG6QKLxCjRW3H44fvCGBwgC6fgJCbJtD1BDhZAYIsl7J/nfc7EfqXVOtdpbXic0pc26FWvqnYz3mgQJtAi+WMOrH5uvwCvldyzjdzUUAfnZInS+hgcjIJpUF1up/oAmlG5JiWF+GHkKZlJnBK9RtGSIpS5C1DQDpOs7s+u0KIITdvQC24lKrc9w55k6G9vHAOmW/JB070PkrQHcdghb/IF3XullSSRIvgjjBr0ixxs2os8L2vnWfcLOJfrFxpAW22Pct6kD8iJIH9jutSfWyR+AzDoZmT4NbuLnlJ/mFj/4VvubzYK3w17iEqDjhpG87+ViIlyBhQAgBqnkPpquLwxR0fCqY7vm7nv+IN/npJ/TW04qPFYjIhfBIvkqU2X8XGp3NjT8aUpAT6aoZo5TzOuKgD5GcRhyH4Ogh346TdSmjsdd17gvFwWZ661QsXhJxllGttjIgXxXEgZZW1HmHjLpQ3SKxq3wSg2eztiL5M6vBQcFZjIDz4Vb0FKqEPAkC1i1Gro48Yb7qQ1Heo4W9RK3Z88RLNpuZ4XX7o6cuJ+T2k1FPrYBkUw7vb42HjeM9WdcCmaar0Ya20gs7bNVTGuCtRdsOkXtnNoW6X6SBAiGGfmpX52V/5KR+D61P6A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(30052699003)(7416014)(376014)(23010399003)(1800799024)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9FL7wWvTxCWziFkOWhn8hecdzn7WjT36CLVrzHWPbChpxGCaZaw4t7A8oh9NoT+ttZp/l8zss28KGTno6J2ESBknrDRLZAJ882KMoX2lsdzuRxW673jTdJ6rdTvE/ljbQgzcYWF0dgFqioTx4bCIF3ZSvo543zxp+wbhl2JUVe5RDtTEP3kbWaq6KZGjF7hc+k/ysslHbT7cJT5kX9AVddW90lXUfmnBal1j5+bplxpJtZJmwjsm9zeZuD6OZo3OR/n3+0vHrTZhHmlU3ctjS1XdHgFEFKlsI9h6EtnVVgdGC2VcNKIAVZV9YXEHVdXfYshXAAng25LSGSGGZfRuOatS53aIGRu/mWoxr7VXoDGuk3DNhxM3MdhBGlQrj80H6cXPz9/BJkXYi3Rqv1GhzZKDeawQvVoX2FyIJkR2pPNHzF1ARIHU4nl1e5ONadzP
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 07:51:52.8029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c065e2-8102-4e0a-fc10-08df12350a94
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018549.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8019

GSP plugin shutdown completes through a separate event carrying the
GFID. Releasing the queue lock between sending and waiting allows another
receiver to consume that completion.

Hold the lock until the caller's predicate matches the completion event.
Pass unmatched GMC events to the caller and keep one receive deadline
while processing interleaved traffic.

Co-developed-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 61 +++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 891dec5c108a..137242ca0b11 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -745,6 +745,67 @@ pub(crate) fn send_gmc_and_check_status(&self, command_id: u32, payload: &[u8])
         }
     }
 
+    /// Sends an asynchronous GMC command and waits atomically for its event.
+    ///
+    /// The command queue remains locked from the send through the matching
+    /// event, preventing another transaction from consuming its completion.
+    /// Interleaved GMC events are passed to `handler`; responses are consumed
+    /// while waiting. The receive deadline starts after sending.
+    ///
+    /// Both callbacks run with the queue locked and must not reenter this queue or reset it.
+    /// Their second argument is the raw `max_resp_or_status` word of the event header.
+    #[expect(dead_code)]
+    pub(crate) fn send_gmc_and_wait_event(
+        &self,
+        command_id: u32,
+        payload: &[u8],
+        timeout: Delta,
+        mut predicate: impl FnMut(u32, u32, u64, &[u8], &[u8]) -> Result<bool>,
+        mut handler: impl FnMut(u32, u32, u64, &[u8], &[u8]) -> Result,
+    ) -> Result {
+        let mut inner = self.inner.lock();
+        inner.send_gmc(command_id, payload, 0)?;
+        let deadline = Instant::<Monotonic>::now() + timeout;
+
+        loop {
+            let remaining = deadline - Instant::<Monotonic>::now();
+            if remaining.is_negative() {
+                return Err(ETIMEDOUT);
+            }
+
+            let matched =
+                match inner.receive_gmc_and_dispatch(remaining, |header, payload_0, payload_1| {
+                    let header = &header.gmc;
+                    let result: Result<bool> = (|| {
+                        if header.is_response() {
+                            return Ok(false);
+                        }
+
+                        let command = header.command_id();
+                        let max_resp_or_status = header.max_resp_or_status;
+                        let sequence = header.sequence;
+                        if predicate(command, max_resp_or_status, sequence, payload_0, payload_1)? {
+                            return Ok(true);
+                        }
+
+                        handler(command, max_resp_or_status, sequence, payload_0, payload_1)?;
+                        Ok(false)
+                    })();
+                    (Some(result), QueuePointers::Unchanged)
+                }) {
+                    Ok(matched) => matched,
+                    Err(ERANGE) => continue,
+                    Err(error) => return Err(error),
+                };
+
+            if let Some(matched) = matched {
+                if matched? {
+                    return Ok(());
+                }
+            }
+        }
+    }
+
     /// Waits for an unsolicited GSP event of type `M`, consuming any other event that arrives
     /// first.
     ///
