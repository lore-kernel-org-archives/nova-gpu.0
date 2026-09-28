Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010064.outbound.protection.outlook.com [40.93.198.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9F03C10A4
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 10:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591462; cv=fail; b=FSqdyi03+bXBhfYdyjWPU4o4nk/fEU35xrdLqDsd4Gp6NtgfshyI8M3pJRR5dDBc2sX5uY9kIrPQoHk3fpz1jA0lWeTv3ulaP7zXQRWSTRZ4vBUl1bSZksNYDv1wLTG39qsoEYP6A+CTY0G8DftHFZX2kQh0nNFzt1HZ2npHgyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591462; c=relaxed/simple;
	bh=sb2omEc6d9Ng9FLaEbFA5u5Slrtu/MEldChcmwZEhfw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cBWbaYVym9VETxGlhMPj7YpTCtzmtF0T1g21teAGucybP1nwTtiO7QIxRwWatcn9bkg1Dt8FiV8oihFez3aTRT6SnFM7lu2vF3pFZkhHHLaFdCCS2UaK10S1n0BIyc4ZaHthyagDW27Y6/A/qxLOQq2fdJMiPsnGfRTjRf1MRuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dGwulg3S; arc=fail smtp.client-ip=40.93.198.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dGwulg3S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJTifAE4Z6ouvZTGkSvl9bzVNpSffXOrWw7ZGF0rYc+79Mt1FobSJVIn/3iXwRG5jvUjX93qmG/QJQGx9H2c6HvzgejHhmx2RZirVOimRW2erpp3bw6ekk6SBQ5LbpTUrFIkk5o7kdGxGYV36PcOiSSsjxSOWb7J/H0Mrv9proLkIYD3dh8qVwvmmSFkcpO1r00IX1IZuJ6L1j3ZcSDrNiN0I91H/BXKKjFZfw1q8vbDsHk1aZx2pfXNrj3/P44POCiwUs+IxxrkIjpAfd1ww9cp6gHslGpuzsPOUg0RZMdl17Qu56cWSGcjUGj7+68DvGK4Fb0RqNvb+FdTLIb9Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5BHcfVVdrzNLDqYjVVjSeaG5xM3upmlhM8oZ9ey9LY=;
 b=xAoyVfMdjKEEGjBIvg7aG+EC4hUsL8WUQjehfF6ZKEePBvjtQrdJqARgzVNcdp41dTAJSTCGixteuRWa3j63bD/lR2Xb8ImnTsDvt/7u+PfPHKI47di9VMLBgknppimzawM7fyJG4ISz6zWr+4N99yNBpo/aFyjI8lfV+Z+uuusnqnKHEfWZyBI5TR9D4ZNVI0pm9JE97D76SSXJOANkumnqiRXwYMF/2j9BJH8XBGe68tv4olunu74/0K8G0mtBL7xTDCwvlDnS8KVI8B+Pff2VHcs0seji4f5djR7GGGp80ZTzyRzWhTmDl1vGo03cUiVXwZ3SFX9NeE/r0xdPhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5BHcfVVdrzNLDqYjVVjSeaG5xM3upmlhM8oZ9ey9LY=;
 b=dGwulg3SvILnyBNraUT8w52x0cEtYZK/qXmlPk+ZEOyCr8mBxZmN9+5zjhfRsgjHIqzu46wf+NWAFefOOmRwuN3kM4HKilsIAroSdZUOAek+PNpJOUBWzLfl8GSw2kmxtBM97QuH3qLEhbL1RUWyJCgYZXiAwhAkPuFXocb9I/vagzXBhvL7+gjQfk+qPWlkdDlmL8Z3P20v3TvQzHTf95YVuZa2THsY8PX6zOH5mreCdiBpFWqWS7zRONpj6SUYYF+Coxf3R3RMfR3Jp1f8WLt+UU1sFnikuq0ff5SkHplrY9VR8nVw/8jxeKihWJ28vxkJQpU4D1bken7Gf0xVKA==
Received: from SJ0PR03CA0369.namprd03.prod.outlook.com (2603:10b6:a03:3a1::14)
 by BL1PR12MB5802.namprd12.prod.outlook.com (2603:10b6:208:392::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 10:30:52 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::98) by SJ0PR03CA0369.outlook.office365.com
 (2603:10b6:a03:3a1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 10:30:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 10:30:51 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:30:32 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 03:30:31 -0700
Received: from inno-dell.home (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Mon, 28
 Sep 2026 03:30:23 -0700
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
Subject: [PATCH v3 12/31] gpu: nova-core: gsp: add synchronous GMC transactions
Date: Mon, 28 Sep 2026 13:28:15 +0300
Message-ID: <aee97e22c6a87984e449c5d4e89bcde4e48a77dc.1790580105.git.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|BL1PR12MB5802:EE_
X-MS-Office365-Filtering-Correlation-Id: ae7f7ed2-8155-4e48-1b28-08df1d4b91f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|7416014|376014|10067099003|11063799006|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wmzaQl8Gxw+4mcDQsKYZp2iTb3pL/JnNJlU0saKNoD/mXqjBpfphD+9D86KuYL1PgGLs7+YRB4hFN4NrS77Sd1Il7MZstMNFXAFSpzQMiAxeqD11yrYbB/CLWCUOQuPJJhan03vKQfF6IPSP0k/QHLB56E1xQylue4FSpnVMMHmhORduZN8MUYzWTdGHQ2wWZRrY1009E0M2Ixgcp8rUO4XGxBbHsACS2ZySFF7308GFhmON57URB/aXtH/4i/jW6J7/YyYPg0oYT+MH7LfJnon/1KU1ZL1FZFJDSIDN57NgpBfIqkBVOkUZCh+sIjSDmpcNmABtLmJ5EE52OJxaFpbdwuuzoCJpGbWha+iyNZkWWQ6vN7yTHpgUYbUNFqYIxh5ly9SKG7Q23RVyQIvwAo+O/MhQHCKMElTneWDX+011LeY6pqSi+auT46LvKfaESyJ8npiLaqAIC4GvTedCIJfRKVxn3HKr7TmP5d+viLXLsj0fTDztdht8+LcoupkgjgvuS9tUKl7sqOa+TPJ4aLhVxEjxUgy1BbLkCJ9DhwvZf+cC9tmYNZlgvG0w38FADDKriF+N9b8dqyJrtYumwf8zpeSnbRKzq/eO4Kplk1QI4ZNvpGAQ7cP+rsWreTuhTwcR8UHSvYRIa/580AnnLwDzXIozp1VEyemqz4B+PLwX1y3+boUJYwvYkS1uLfXYiZY/FzQswEqusB1jL4+w2A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(7416014)(376014)(10067099003)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hAj12ZP+nRp2iMV7oR74vvRGQ3G04jhYp5sItMxzmQ7igV0KD/EA89CSgd1XMnOT1LKDd8E1SBOebNwxArvEysl0w2AZgqeQtJzv+Nj7BGF7kFiGEUab+1JVceoY8VH1SpRimlDr3TWNRTZkiCIOKTUkZHpZeID9StoZk+PHJsVbNhU8Nsb28aRcruuSnPC/bqPBFWzHkrgc/WAKVulasmfNeNi3iwHhS/nF95qrR2YteQ+G9+QaP/4kX9SNt08QFK7UbH1CXK8egvCIYxAN9ddCNaBEbpjta4OgWRexKrdgs+RvlbOOK7hlGnxN9G19aolqIo8FEWLVIV90CCJkA7dOqJGUfp1S2F/OqbOGxx0Hg01mFC1DAnbjzUbKd1W5XV+TkEkxaCmYad7WchqdSwEZRQt79ehT8kc9Ar1vb59eAUgoTqh6Cnj0zbTA3Zpx
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:30:51.7460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7f7ed2-8155-4e48-1b28-08df1d4b91f5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5802

vGPU management queries need an owned response payload after the receive
queue releases its slot. Sending and receiving must share one queue
guard so another receiver cannot consume the reply.

Match the response flag, command ID and request sequence, then copy the
payload and return the raw firmware status. Support the default receive
timeout and a caller-selected timeout without converting firmware
rejection into a transport error.

Share the receive deadline and retry loop in CmdqInner with the existing
GMC boot response wait. Preserve each caller's matching and status
policy, consume every valid element once even when its callback fails,
and keep a single deadline after sending. Document unmatched-message
consumption and distinguish a zero response payload capacity from a
command that sends no reply.

Co-developed-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Alok Kumar <alkumar@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 Documentation/gpu/nova/core/interrupts.rst |  17 +-
 drivers/gpu/nova-core/gsp/cmdq.rs          | 174 +++++++++++++++++----
 drivers/gpu/nova-core/gsp/fw.rs            |   6 +-
 3 files changed, 161 insertions(+), 36 deletions(-)

diff --git a/Documentation/gpu/nova/core/interrupts.rst b/Documentation/gpu/nova/core/interrupts.rst
index fa124bc8ca05..45ba788bfe27 100644
--- a/Documentation/gpu/nova/core/interrupts.rst
+++ b/Documentation/gpu/nova/core/interrupts.rst
@@ -576,9 +576,12 @@ command reply or an unsolicited event, and the two differ in the function code.
   records, lifecycle notices) need no action and get no line of their own,
   because the receive trace at debug level already records every message's
   arrival with its sequence number, function code, and length.
-* A GMC message carries a command id in place of a function code. Only the
-  ``GSP_INIT`` wait during boot claims GMC messages, so one that arrives
-  anywhere else is logged at warning level and dropped.
+* A GMC message carries a command id in place of a function code. The
+  ``GSP_INIT`` wait and synchronous GMC transactions claim responses with the
+  expected command id and sequence number. These waits consume interleaved RPC
+  messages as events. Unmatched GMC messages are handled by the wait's callback
+  or logged and consumed; a queue drain with no waiting caller logs them at
+  warning level and drops them.
 
 A command's reply must carry the RPC sequence number that nova-core wrote into
 the command, as well as its function code. A message with the awaited function
@@ -600,9 +603,11 @@ the device is reset.
 The polling path and the IRQ thread both read the queue under the command-queue
 mutex. Replies and events share one queue and one read pointer, so one lock is
 held across the whole drain. A thread waiting for a reply logs each event that
-arrives before the reply and keeps waiting. One deadline of 5 seconds applies
-to the whole wait, rather than a fresh timeout after each message, and the
-thread holds the mutex for the whole wait, so no other caller consumes the
+arrives before the reply and keeps waiting. One receive deadline applies to the
+whole wait, rather than a fresh timeout after each message. The default timeout
+is 5 seconds; GMC transactions can specify another timeout. For send-and-wait operations the receive deadline starts after sending,
+so it does not bound waiting for the mutex or for command-queue space. The thread
+holds the mutex from sending through receiving, so no other caller consumes the
 message it waits for.
 
 With one lock, a drain waits for an in-flight command's receive to finish or
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index c63cd450df41..df3d45a13a13 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -548,6 +548,16 @@ fn payload_length(&self) -> Option<usize> {
     }
 }
 
+/// Response from a GMC API command.
+pub(crate) struct GmcResponse {
+    /// Response status (`NV_STATUS` code). Zero means success.
+    #[expect(dead_code)]
+    pub(crate) status: u32,
+    /// Response payload copied out of the message queue.
+    #[expect(dead_code)]
+    pub(crate) payload: KVec<u8>,
+}
+
 /// GSP command queue.
 ///
 /// Provides the ability to send commands and receive messages from the GSP using a shared memory
@@ -688,6 +698,99 @@ pub(crate) fn send_gmc_no_wait(
             .send_gmc(command_id, payload, max_response_size)
     }
 
+    /// Sends a GMC API command and waits for its matching response.
+    ///
+    /// Uses [`Self::RECEIVE_TIMEOUT`] as the receive timeout. Firmware rejection is returned in
+    /// [`GmcResponse::status`], not as an error.
+    ///
+    /// See [`Self::send_gmc_and_receive_timeout`] for message consumption and locking behavior.
+    ///
+    /// # Errors
+    ///
+    /// Returns the same errors as [`Self::send_gmc_and_receive_timeout`].
+    #[expect(dead_code)]
+    pub(crate) fn send_gmc_and_receive(
+        &self,
+        command_id: u32,
+        payload: &[u8],
+        max_response_size: u32,
+    ) -> Result<GmcResponse> {
+        self.send_gmc_and_receive_timeout(
+            command_id,
+            payload,
+            max_response_size,
+            Self::RECEIVE_TIMEOUT,
+        )
+    }
+
+    /// Sends a GMC API command and waits up to `timeout` for its matching response.
+    ///
+    /// Matches both the command ID and the request's sequence number. A nonzero firmware status
+    /// is returned in [`GmcResponse::status`]; the caller decides how to handle rejection.
+    /// `max_response_size` advertises the response payload capacity in bytes, so zero still
+    /// permits a status-only response.
+    ///
+    /// Unmatched GMC responses and events are debug-logged and consumed. Interleaved RPC messages
+    /// are logged as events and consumed. The matching response is also consumed if copying its
+    /// payload fails.
+    ///
+    /// The queue stays locked from sending through receiving. One receive deadline starts after
+    /// sending and is not extended by other messages. It does not bound waiting for the mutex or
+    /// for space to send the request.
+    ///
+    /// # Errors
+    ///
+    /// - `EMSGSIZE` if the request exceeds the command queue's maximum element size.
+    /// - `ETIMEDOUT` if space does not become available to send the request, or if the matching
+    ///   response does not arrive before the receive deadline.
+    /// - `EIO` if the command queue slot cannot hold the request headers, the receive queue is
+    ///   poisoned, or a received element fails framing validation.
+    /// - `ENOMEM` if the response payload cannot be allocated.
+    ///
+    /// Errors from initializing the request headers are propagated as-is.
+    pub(crate) fn send_gmc_and_receive_timeout(
+        &self,
+        command_id: u32,
+        payload: &[u8],
+        max_response_size: u32,
+        timeout: Delta,
+    ) -> Result<GmcResponse> {
+        let mut inner = self.inner.lock();
+        let expected_sequence = inner.send_gmc(command_id, payload, max_response_size)?;
+        let dev = inner.dev;
+
+        let deadline = Instant::<Monotonic>::now() + timeout;
+        inner.await_gmc(deadline, |header, payload_0, payload_1| {
+            let header = &header.gmc;
+            if !header.is_response_to(command_id, expected_sequence) {
+                let kind = if header.is_response() {
+                    "response"
+                } else {
+                    "event"
+                };
+                dev_dbg!(
+                    dev,
+                    "GSP GMC: skip {} seq {} cmd {:#x}; want response seq {} cmd {:#x}\n",
+                    kind,
+                    header.sequence,
+                    header.command_id(),
+                    expected_sequence,
+                    command_id,
+                );
+                return Ok(None);
+            }
+
+            // Each byte slice is at most `isize::MAX` bytes, so their sum fits in `usize`.
+            let mut payload = KVec::with_capacity(payload_0.len() + payload_1.len(), GFP_KERNEL)?;
+            payload.extend_from_slice(payload_0, GFP_KERNEL)?;
+            payload.extend_from_slice(payload_1, GFP_KERNEL)?;
+            Ok(Some(GmcResponse {
+                status: header.status(),
+                payload,
+            }))
+        })
+    }
+
     /// Sends a GMC API request that GSP-RM does not answer.
     ///
     /// # Errors
@@ -1395,6 +1498,35 @@ fn receive_gmc_and_dispatch<R>(
         })
     }
 
+    /// Waits until `handler` returns a value for a GMC element, using one receive deadline.
+    ///
+    /// Unclaimed elements do not extend the deadline. Every valid element is consumed, including
+    /// one for which `handler` returns an error; RPC elements are logged as events and consumed.
+    /// The caller retains the queue guard throughout the wait and the handler calls.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if no GMC element satisfies `handler` before `deadline`.
+    /// - `EIO` if the queue is poisoned or an element fails framing validation.
+    ///
+    /// Errors from `handler` are propagated as-is.
+    fn await_gmc<R>(
+        &mut self,
+        deadline: Instant<Monotonic>,
+        mut handler: impl FnMut(&GspGmcMsgElement, &[u8], &[u8]) -> Result<Option<R>>,
+    ) -> Result<R> {
+        loop {
+            let remaining = deadline - Instant::<Monotonic>::now();
+            if remaining.is_negative() {
+                return Err(ETIMEDOUT);
+            }
+
+            if let Some(value) = self.receive_gmc_and_dispatch(remaining, &mut handler)? {
+                return Ok(value);
+            }
+        }
+    }
+
     /// Waits for the response to the GMC request with command id `command_id` and RPC sequence
     /// number `sequence`, up to [`Cmdq::RECEIVE_TIMEOUT`] from the call.
     ///
@@ -1420,35 +1552,23 @@ fn await_gmc_response<R>(
     ) -> Result<R> {
         let dev = self.dev;
         let deadline = Instant::<Monotonic>::now() + Cmdq::RECEIVE_TIMEOUT;
-        loop {
-            let remaining = deadline - Instant::<Monotonic>::now();
-            if remaining.is_negative() {
-                break Err(ETIMEDOUT);
+        self.await_gmc(deadline, |header, payload_0, payload_1| {
+            if !header.gmc.is_response_to(command_id, sequence) {
+                return on_other(header, payload_0, payload_1).map(|()| None);
             }
 
-            let response =
-                self.receive_gmc_and_dispatch(remaining, |header, payload_0, payload_1| {
-                    if !header.gmc.is_response_to(command_id, sequence) {
-                        return on_other(header, payload_0, payload_1).map(|()| None);
-                    }
-
-                    let status = header.gmc.status();
-                    if status != 0 {
-                        dev_err!(
-                            dev,
-                            "GSP GMC: command 0x{:x} failed, status={:#x}\n",
-                            command_id,
-                            status
-                        );
-                        return Err(EIO);
-                    }
-
-                    decode(payload_0, payload_1).map(Some)
-                })?;
-
-            if let Some(response) = response {
-                break Ok(response);
+            let status = header.gmc.status();
+            if status != 0 {
+                dev_err!(
+                    dev,
+                    "GSP GMC: command 0x{:x} failed, status={:#x}\n",
+                    command_id,
+                    status
+                );
+                return Err(EIO);
             }
-        }
+
+            decode(payload_0, payload_1).map(Some)
+        })
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 90bb324666e5..71732418e7a5 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -814,7 +814,7 @@ pub(crate) fn status(&self) -> u32 {
     /// sequence number `sequence`.
     pub(crate) fn is_response_to(&self, command_id: u32, sequence: u32) -> bool {
         self.is_response()
-            && self.command_id() == command_id
+            && self.command_id() == (command_id & GMCAPI_COMMAND_ID_MASK)
             && self.sequence == u64::from(sequence)
     }
 }
@@ -911,8 +911,8 @@ impl GspGmcMsgElement {
     /// Creates the queue element header and the GMC API header of a request that carries
     /// `payload_size` bytes of payload under the RPC sequence number `sequence`.
     ///
-    /// `max_response_size` is the largest response that the sender accepts, and zero for a request
-    /// that GSP-RM does not answer.
+    /// `max_response_size` is the response payload capacity in bytes. Zero permits a status-only
+    /// response; whether GSP-RM sends a response at all is determined by the command's protocol.
     ///
     /// # Errors
     ///
