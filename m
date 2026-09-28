Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012000.outbound.protection.outlook.com [40.107.200.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3164DDA9
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591472; cv=fail; b=INs9GEj94O0+ZcyixYi0C4ELUgo6d+5+q9Vmp0NIUdPsJKVSLgP44DPqNt6jOXbCS7QkhPu2QE7E+QCXShYAHhaQXOuVjvGPaRicSDsZvajIcEtY2fXne/tcWNwFUxBTlp2gLmtv6d6H6XIuH5B3JBL01pGZ8TYbkJ1U58zNekg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591472; c=relaxed/simple;
	bh=zsdJEkYkBQRUpOEJytJabNO0HG3ll98yeut16OVMxRQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nsgP3t5j7+0DZGNkMHpaw4kIA5cuhBW8fWtAet5l+bDXDMOcIQv2lk312im5/5f6sbOnbfyuDzqw7Fr1/OfSy0l7E2eeQ1sYmTZ4K9cMxyGmKi1mdJnppnQ5IjNHu4Fm+Tcaw5zgjc0dNJ6VTgtKu6DZG448YPeGgUTjt0/14fA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TZk1ct0c; arc=fail smtp.client-ip=40.107.200.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TZk1ct0c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rF58SV37YbnG0HC7IOnKWbKe1ixd7PWcAD2OhOMMSxAM6cSZupX2FwrzqBnftHvaUOiQR4twpu3qk1xN3nEsxzisa8Q4+djW80jda/TgboFtLgQjGbJI8DhcpYjGA5tRkYaTQdCZvs5mFsSM1W7UFsA8UHXOlaO81b4EBzsBy8AUXIPzI7JfP+CiGNIZ5wCyqjhpkZczq2ZOlg7zu6PIhjkpJ4QbmYnfObU497Lhwk9dt8sAI/haJqYoYjQaidAYl/zxwX1mxaqxj1/eVxooOxd8pwyTsDrp6waYuoDiJ9Hpy0ZNwKjMbge9YANqbhET2Myais5m1bHZcRWpF7MIHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XiJed/SfiNfFFnCKYiiV797XbfjlfPeM9XTzioRY8Bs=;
 b=UypPIy7aj9J7Unsoz6ROLL26iJ8NSqYt17eQYmjMhMbiMGiTLxpUnBGMOuVgvxioyMBUCC3nlBQAuFOvb1qCTIdE2Qjx1yAohjobwKEeWjIaXH7wjcfhErSWXerEnPOCelX9FwiWKtgyabSN9JNoBqJQMXYAuhkmAg9K5S13o/AjmMQKSH27OnDxw2UUOo09IpQdvBGxRsXXZRxX5TW2MAvZuJPCfeK6YuKul70TncAml34dP8dVORI08GSY9wwzK9EmUwYSoXeWamNl4QlKgQcbK0cWbLTnhJ7Fdc/M/zaf+71ttNSLzyj3wW3kHZFvIdOwzGSwQ14cu5C2G/9mag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XiJed/SfiNfFFnCKYiiV797XbfjlfPeM9XTzioRY8Bs=;
 b=TZk1ct0cb6F+flR2331mMtKCYn/xMWGbLZEpKnUGLDhfxhu+YfxqgrwccLv00CWc1bJLJLlzs8MDbL6hMxNyXR01/8SaAGxrOqfvAsEO41j5mIkHbgppL8M5AEyBJDJOvvB7p4IsTEDQiXoJehbH+0N7WhlA59Rx7TqFsHp4LVnxsGn0sHMCar9s4TuWh/mGUKGfyArggdqdOg/iINVMolDQMhqJq5NbM6WYs+a1Hfvvexe2QcHVW7xQvQ6FcsICHLzCeIfrHuPyJrL2I51mGIzCRQwAX+arp286BosizJrwKm601q1jVw+PLBksI98vm6eXQHSb+2oOpdcxXPXRjw==
Received: from BY1P220CA0047.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::9)
 by MW6PR12MB9018.namprd12.prod.outlook.com (2603:10b6:303:241::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 10:31:03 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:a03:59e:cafe::33) by BY1P220CA0047.outlook.office365.com
 (2603:10b6:a03:59e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:31:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:31:02 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:30:40 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:30:40 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:30:32 -0700
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
Subject: [PATCH v3 13/31] gpu: nova-core: gsp: wait for GMC completion events
Date: Mon, 28 Sep 2026 13:28:16 +0300
Message-ID: <4f6e999f86d57cf91a6c8b146b05afaa08c189c2.1790580105.git.zhiw@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790580105.git.zhiw@nvidia.com>
References: <cover.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|MW6PR12MB9018:EE_
X-MS-Office365-Filtering-Correlation-Id: 028e9283-aa3e-43e8-949c-08df1d4b9889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|30052699003|7416014|376014|82310400026|1800799024|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mGKKopgDBVjt8zw+7ozKbx7dAoqjHuPDk578AqQQQg1iV+yzi4CQN2OqfaPylMC8HTB3GJtZJjnRA0YXDuYGYbbx0k83qd940n6rUEMwvTYDhCnSSzZP3puIgPdUuM1yCYIhoVNhskaUdc/92EG9DXw1tzXAjH/+AFwX2uIQDvOVp8Pafdt5LBG3NH3Q1CxEMl00kDguqLIPzCGVTtwrb7BeyKsAUDDnUIdZM4ZKvUO+G94gkuWM4sHO4PRrwqbKP21wFAHc9ArI44p3gxQsl1jAIqs8D8FFh38iVJGI8N4EmXtMW3S3m7B7Pm8E0K+Vo/05J+fK65q0qCJbgpCqM6uA5ZmWsNGtcW3rwFIifBQdwoDrl1kILaV7mNr/vffFXLz6sUjMy1pA8PsEi0ioH6jJoC2JiE1TS07OvWJ+mC5lijNn0vVvYvGgq9ykaDXmYUOZIvGeRpnFWgwvGhCHB9A+L22epwNpkD36I3Vyy9RUZOarccPIwq4etkkfBLQUui1GZRoDSmQxIrro1FTNYQrnAXCXjviSiOCuanZG6YBWkNADdbhCLerDiDncU7L5fcImkmj2zWtB6GqPLv2dZU1fgIz3ONs/bEOuJRdzGDxmedE465aK7gRSXho9aL4G/ghjP7Uehdm5OcLj5PKv850pAjCdqZQKAE5zI7UdCAgGrrqjcZ7TYQy5iA5dAglPlYijYRwiRJ1usaJjBqnJcQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(30052699003)(7416014)(376014)(82310400026)(1800799024)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FlYFtM+dytlug8PO45Owt7GcDL6TvGZJJMaEUzUhrNESckJGJ7n53PLWUiAkY7H03huLmmLBI+0UwfqEzoLKaCq4ZBomxJBCOJIanVVFvGNQ4iEAwd+0CJg9wcV5sys/2V32X2pOtgM3U7JbdB/JksILyYGsAHoTe2SWeXnMpPPPu/B90HGAmR6p+8gAhSoa6jRTqtYWzh1l/wNFg+lZJSgP/+uTqP/nMSIR+dFoYfzAoW+iHDMnPRyf3vv9OfaFCOqalEV1dbMw1Ny62Y57EYB9IlffOjKzKAgWHm7yeXLkNF3NJy0pe1mbcmeL799QbuFvoF8bfCVNW14DdZAohUyJRvZaBQUmCD9zd69mmzKS+hjolYWV9ai/0hX/Pm3TeFKyxEX9UvVQWwaA+AK1lhSTiyy5lflzVIIvaOy/TtrNMT7pfTC8FspjNJxIodXE
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:31:02.7864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 028e9283-aa3e-43e8-949c-08df1d4b9889
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9018

GSP plugin shutdown completes through a separate event carrying the
GFID. Releasing the queue guard after sending would let another receiver
consume that completion.

Keep the guard from sending through the matching event and use the
shared Inner receive deadline. Offer GMC events to the completion
predicate, pass unmatched events to the caller's handler, and consume
interleaved responses and RPC messages. Represent completion with a
value and all continuing cases with None.

Propagate callback errors after consuming the current valid element.
Document callback non-reentrancy and that the receive timeout starts
after sending, excluding mutex acquisition and command-queue space
waits.

Co-developed-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 Documentation/gpu/nova/core/interrupts.rst |  6 ++-
 drivers/gpu/nova-core/gsp/cmdq.rs          | 55 ++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs            |  7 +++
 3 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/nova/core/interrupts.rst b/Documentation/gpu/nova/core/interrupts.rst
index 45ba788bfe27..f78b1294905b 100644
--- a/Documentation/gpu/nova/core/interrupts.rst
+++ b/Documentation/gpu/nova/core/interrupts.rst
@@ -578,7 +578,8 @@ command reply or an unsolicited event, and the two differ in the function code.
   arrival with its sequence number, function code, and length.
 * A GMC message carries a command id in place of a function code. The
   ``GSP_INIT`` wait and synchronous GMC transactions claim responses with the
-  expected command id and sequence number. These waits consume interleaved RPC
+  expected command id and sequence number. A GMC completion-event wait uses its
+  caller's predicate to select an event. These waits consume interleaved RPC
   messages as events. Unmatched GMC messages are handled by the wait's callback
   or logged and consumed; a queue drain with no waiting caller logs them at
   warning level and drops them.
@@ -605,7 +606,8 @@ mutex. Replies and events share one queue and one read pointer, so one lock is
 held across the whole drain. A thread waiting for a reply logs each event that
 arrives before the reply and keeps waiting. One receive deadline applies to the
 whole wait, rather than a fresh timeout after each message. The default timeout
-is 5 seconds; GMC transactions can specify another timeout. For send-and-wait operations the receive deadline starts after sending,
+is 5 seconds; GMC transactions and completion-event waits can specify another
+timeout. For send-and-wait operations the receive deadline starts after sending,
 so it does not bound waiting for the mutex or for command-queue space. The thread
 holds the mutex from sending through receiving, so no other caller consumes the
 message it waits for.
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index df3d45a13a13..43038c7fe823 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -791,6 +791,61 @@ pub(crate) fn send_gmc_and_receive_timeout(
         })
     }
 
+    /// Sends an asynchronous GMC command and waits atomically for its event.
+    ///
+    /// The command queue remains locked from the send through the matching
+    /// event, preventing another transaction from consuming its completion.
+    /// GMC events are passed to `predicate`, then to `handler` if the predicate returns false.
+    /// GMC responses are debug-logged and consumed without invoking either callback. Interleaved
+    /// RPC messages are logged as events and consumed.
+    ///
+    /// One receive deadline starts after sending and is not extended by other messages. It does
+    /// not bound waiting for the mutex or for space to send the request.
+    ///
+    /// Both callbacks run with the queue locked and must not reenter this queue or reset it.
+    /// Their second argument is the raw `max_resp_or_status` word of the event header.
+    ///
+    /// # Errors
+    ///
+    /// - `EMSGSIZE` if the request exceeds the command queue's maximum element size.
+    /// - `ETIMEDOUT` if space does not become available to send the request, or if no event
+    ///   satisfies `predicate` before the receive deadline.
+    /// - `EIO` if the command queue slot cannot hold the request headers, the receive queue is
+    ///   poisoned, or a received element fails framing validation.
+    ///
+    /// Errors from initializing the request headers and from either callback are propagated
+    /// as-is. The current valid element is consumed before a callback error is returned.
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
+        inner.await_gmc(deadline, |header, payload_0, payload_1| {
+            let header = &header.gmc;
+            if header.is_response() {
+                return Ok(None);
+            }
+
+            let command = header.command_id();
+            let max_resp_or_status = header.raw_status_word();
+            let sequence = header.sequence;
+            if predicate(command, max_resp_or_status, sequence, payload_0, payload_1)? {
+                return Ok(Some(()));
+            }
+
+            handler(command, max_resp_or_status, sequence, payload_0, payload_1)?;
+            Ok(None)
+        })
+    }
+
     /// Sends a GMC API request that GSP-RM does not answer.
     ///
     /// # Errors
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 71732418e7a5..a416826737bb 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -802,6 +802,13 @@ pub(crate) fn sequence_number(&self) -> u64 {
         self.sequence & !GMC_EVENT_SEQUENCE_BASE
     }
 
+    /// Returns the raw `max_resp_or_status` word carried by a GMC header.
+    ///
+    /// Its meaning for an event is defined by that event's command.
+    pub(crate) fn raw_status_word(&self) -> u32 {
+        self.max_resp_or_status
+    }
+
     /// Returns the `NV_STATUS` that a response carries.
     ///
     /// The value is meaningful only when [`Self::is_response`] is `true`. In a request, the same
