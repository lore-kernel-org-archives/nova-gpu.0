Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011055.outbound.protection.outlook.com [52.101.57.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BC43290AF
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363777; cv=fail; b=iIKwpSFFuWaGrmud/weyA1GGtuAq4okHeIYvObj6HQN8yy56BdVgHtKHS8Buogy/eaty/wYpAFWlzCsxvs9283MFPCI3doKK5mIBKfxSrRPSevoR32XIq1EvhMm1xWfqWyt1+MbRFpf8QIbt+uR/UwS+D/ddrVFHEVBh6xLQif4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363777; c=relaxed/simple;
	bh=aw536AnyVZJhPL9pnHt7Xzb+DyjKE0cCRxFvqC+uc3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h7oqYrlioKZx+RwMsgUqMSc9x3Xzr8HCUozZ9Qo19X198k4tLndSDqlBN/ZF6b7xux9yFE6Uq4Pv93nBxtlbVppeGFid1moK1qGE7KtxUkgN6cGNZBGQil4nLs1KiqPsQe06f578g7er5qzsC55elfPxut/MF6185NZhUayLdME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IJSx3uO9; arc=fail smtp.client-ip=52.101.57.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IJSx3uO9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgDUPQ7ia6Rs7Foi56I7lrqneRsctOd0xbp5BZV29tbif87pFW6yU+02QZqPg9A3ZjitlVROr2fkFKPwlOVsRMkFVxOevUGV8GTcesyq2je8fk9ITN0L+p6njtT8j4K49cNiH+Ih74eGghxYJF2fNib8AoqX8O2AuikZsy6OI8VtUGu8t6ib78XzkvuwObyE0R1H8o1yEv2Nc+8654g6/43kGxl74Jki786vyfJzHIuDf+8HLqFnM4+Z7V/eLxG0CKLePZGgTTijg1uwOjS3esLVU2rErJJY08gEogie3IsCSDf8HqXvtH+Uo5jWkbBASratqf3bx8ELFEDL3VdfDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwuQ/SLrIlrhudBraH4TXl9ht8Y0fh+f8HrWzP4F2zw=;
 b=TKNdzdnwLHmNT9FnyV365QpYOS1F5q+pxOs9TJ6xrmHuw7LLe90B/lwRM6MMsphZUhSW6Lp3L40iPRNi8tbolqKNkjY5ZY+zmC2eSFj9sR61hAgXkudHqLJCVsIYFE8Vs04xxvjxaoBxXUTxpPvv9Ds7QhWOp8BTP8F09xq3bBL10F8L8PzyYZkJy+Ui1kEPEcoeYUdKmHF4Nx6kZDsliZc2ja7kyR8XJdoC2jhIUJjtmHxp5iLqf3spaH4qN0AZfcUNp+UEO/UjbiAROeCeiGVRZBkVq18Qd8znRH6ibq0n+rNWbYeU9YTNrlO8ZnchQ3EVeepvgcHomqziSWtj/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwuQ/SLrIlrhudBraH4TXl9ht8Y0fh+f8HrWzP4F2zw=;
 b=IJSx3uO931Jr4iDSzOsTwIbWbI+2KDvwrKrFAmw7XAJsDp07RaexSkgbteZAKglHIBKsM/690t0DH9/HTJcd1NjQYNrb3UqZ1FKE4yrR5XeH6qHSLSM2PjS92Ct9xxOg+2PwNYyxXprtvStsMgAK5Dz+OBRJorFpw04SwjymSsODQjVscM3uKumNAwTOQF/C4CwLPStRMlXT1HyQ6VcpSq9+q31rGu1oSzAbE3bKL6mKEryaV9S22YjU6/Yddx2ovJdy0ud6fS4RoI68NXXlHXuFgq+FYCetXvlxUW4yw4xQN15jZ88uPBLinlttFLv52+uVbnBguEiLzxBv2hpIoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sat, 22 Aug
 2026 01:56:08 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:56:08 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 24/31] gpu: nova-core: gsp: send GSP_INIT and decode its reply
Date: Fri, 21 Aug 2026 18:54:41 -0700
Message-ID: <20260822015448.238214-25-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 702d0623-0148-4400-e1fb-08defff08834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|366016|376014|1800799024|6133799003|10067099003|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mLEFAXOk24xKhBpPhflRe/q7mZQGWvdSvoDgBfu1H85VOCQJG8plS+RGoBYGyan5L3teEe0UO8Wu5u/b4KUBogJ/Z8ST4eDX+G2kIrcx3NDCS5sJU/+DqOFEGkZPPTubIelRarKqgSuLy8HD/L9intFeZ8ywjeAe3DJNMKwdmojvOpbHWbk67/cMkJh+l/dF3owDqYT27mCwTppxVOKuFmGlUPTWfdPH7Yzv9R7kv2pivl6PlRqmjCQGfG2Rk0ZSFYeOWxbsMZGVYwx8mHbmROSK+CMNJFiZND6gF3aZzxxzGZHd9a/SJ5GY3JKmZHj8R+mSi8u1btHW6UZqafD373BLWXlGklWuJkR5DfmEvqi5fS4Rj0G2yO5RsSlIrKRGttRjD+xgblTAMkT5XDZUgwvTSnT2P8T3gYJUTJS4lmELuDe8DQRYwIIYzNwuHSN0zNpcIVikNQeUZKrWeYi778NRhBqvPqb9myAkg2A1T29JRxjuFOGTaSAKegT5RgSRKeQArIFw0afOM4tR3rvS8V9G3/BYryLIoiOap8/n4mLCHqoMZyJEzc6BpyoOy+0BHWGV9g2jvToGMz7sSs6tPD60lV+LwblUhyY+eSLrGlRne6b3ZNljxD+sqt+c3uPQVQNJ/GOZUAxsaMs8npl7Pm+jd81LTVHJ7xKoS6FTHQI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YzsXh8OYpPfKtkqXvgQj/ladT01v2qsQvJdYtXp7nJzy07uQtk5E8G73d1bh?=
 =?us-ascii?Q?2oYYXWZWP9Mernt2fFzzZwl9m+3Ggpbtdxs0Zs6Pj6pfAflhOpjO93dm13vT?=
 =?us-ascii?Q?IyqYJ1MxDXbMhfv3uhaWQGjZmrVOZYqepzzT+FJDgJtjPAyTyYisASETeHg+?=
 =?us-ascii?Q?IVbiBeW9hMetIWQpyuIF+TWD4v1oIIZKocz9CsIeiYizSlFQOfJhIid/AyXU?=
 =?us-ascii?Q?cwcwwYQxfqbFpreE+/gZTs2rX3GfE24WdiUlft/Txi+3oQBSYjazLZG6FDV/?=
 =?us-ascii?Q?IuCQFkfsuwxgH9U5p0JNXDRIkX1NrTASUrej370YDkTmxXo8NSl51oM6OR1V?=
 =?us-ascii?Q?BfmSnATCF6EKi6sp0OKXs1/eidYGUumGZPs4qkpa19cn54i4JfAcQNvfmKdW?=
 =?us-ascii?Q?De+Kpz0QkvpUxIHHGJgpIbnxtfU2Y0C2sKrIkJVjeWRyI+SM47XqInkHfAxb?=
 =?us-ascii?Q?TfeSGtPn81upJF1aa4NmxoZGW2xz6oE7BvLYcRhCaoukEz9KW27FzcYdGIau?=
 =?us-ascii?Q?Zd3fIyK703WFjrxJ90YRg0zT2F/lGCOv0FjYu4rRT86MGO7INZWrQDvS2ZiM?=
 =?us-ascii?Q?YJJMu+yxyG/36Rk4qkcT3pYAjfHpIrtAfnI49vkqn0mjZNnnPOnyGsm5XTlW?=
 =?us-ascii?Q?BJ9C8ubgK0efovQKEZv58R3FEvQHUuVit2pzcOxGP/xIloWRwPbDH+tNAJHj?=
 =?us-ascii?Q?rcUPJfAFO9wU+dmidtRpACT9PIg0ZSH/ieFkd9KtdvCU7E8IiRXTM4cGf+x8?=
 =?us-ascii?Q?dlxNZCgdx37tLrHDBPUUOhOispvI8r4YAtX7tHt0dgvLx3LUPB+5PKzM+jvu?=
 =?us-ascii?Q?Fis1/PEkVS3VcwSrEAX+oqANwu2rLoPTS0pY71dPChqxx6SPOFIFVbOzLIDU?=
 =?us-ascii?Q?Jzqo99wVQhhdpjVyc+OsTMG9+sxkMiUeTJeXxDDIG70kDeEzpLNixA7lZqKr?=
 =?us-ascii?Q?wmmcJEu/+yKLLNSeSeGazTkPZQP9mULz4flxf6p2lPAphTS4WZ5YiZ3HiHoY?=
 =?us-ascii?Q?v+aMpQGOInSaXUDnQQbnpul1rEvaT7fLQSN96N5FHnK5wvkX7+5i3vg99FNh?=
 =?us-ascii?Q?v+N4q8GkY910lUNZDlx+ysRR2YTlpjg7PQ3EMDJkoWFBsEsYjFAKRm5S4N5h?=
 =?us-ascii?Q?XoIqJMA789lEFfPQsNm7XZAzPVzJm490nj8SYgnjC1uUdVP31bcH3+mzBM1K?=
 =?us-ascii?Q?lkRNQ5wTbFcfVKqzNekJtIH4WrUfc7nFxgH4zviPzWC4bDakgUvGD4xOK25R?=
 =?us-ascii?Q?ou4/lM0uW62gLGWK72QA9XCm9x3vyOP4UjKQHXGE5aue4CE6sObLi3rDzlnT?=
 =?us-ascii?Q?AFbzT+MABSsN3dyvaEpHhvMQ57IpZQKwtgboms3SQJGKY4EeSFYYjPC1HWFO?=
 =?us-ascii?Q?MNTiy0uzBH1o62P4uEPvXYluGVIHwaUrpoUKaYmDChDgB3omwMPk9vV4LpA4?=
 =?us-ascii?Q?oFslO+5FimEllD1+bcLksrvpNf0BhTdd/uN+/zDVh23lgiesdxT4R3CPTFqI?=
 =?us-ascii?Q?uLgjl3rwQX8sjGKmZNEECLYUKD/Nt4vkFHLqT1CUloENUhS+cLcK9z3NU6rm?=
 =?us-ascii?Q?lhDHwRlB/4KAnk9RAAxF2cKhy4HWK9Xkw8u1g0ODtv69sS7qGhreBA+u/Ewl?=
 =?us-ascii?Q?Bq87/E6XoDlvGKJQLQbCZM6BSUf2X2aspwZeoGSeXOQeT06N9KVYIQLk39rI?=
 =?us-ascii?Q?EK+R5BXuRGwoK98t2PHABKqsnOIkEMbxMQfVaJYXOLfnHn51y+GuDcMK+pCE?=
 =?us-ascii?Q?7zfCc6mssQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 702d0623-0148-4400-e1fb-08defff08834
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:56:07.9155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJkh20rtLxMkggAiN134mr0Z2/re3G4/86qgspp6ixJBYY81vrC11kKTxZNAdgyt9zypj8RiOYjE1rYYw3BAxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603

GSP-RM answers a GSP_INIT request with the static GPU configuration, and
that reply is also what signals it has finished starting. It raises
load-and-execute events in the meantime, so a caller must handle them
rather than wait through them.

Nova-core can build the request but cannot send it: the GMC sender is
private, and the receive path drops the field carrying the reply status.

Add the sender and the receive-side status field it needs, and decode
the reply into the static-info type the RPC path already produces.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs        |  49 ++++++--
 drivers/gpu/nova-core/gsp/commands.rs    | 140 ++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw.rs          |   4 +
 drivers/gpu/nova-core/gsp/fw/commands.rs |  35 +++++-
 4 files changed, 213 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 98d749674df1..d0e93e6a84d0 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -790,22 +790,43 @@ fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) -> Result<M>
         self.inner.lock().receive_msg(timeout, None)
     }
 
-    /// Receives one GMC event from the GSP and passes its command id and raw payload slices to
-    /// `handler`.
+    /// Receives one GMC element from the GSP and passes its command id, the `max_resp_or_status`
+    /// field, and the raw payload slices to `handler`.
     ///
     /// This method may sleep while waiting. The [`CmdqInner`] mutex stays locked across the wait
     /// and across the `handler` call, so `handler` must not call back into this [`Cmdq`].
     ///
     /// See [`CmdqInner::receive_gmc_and_dispatch`] for return values, queue state, and errors.
-    #[expect(dead_code)]
     pub(crate) fn receive_gmc_and_dispatch<R>(
         &self,
         timeout: Delta,
-        handler: impl FnOnce(u32, &[u8], &[u8]) -> Option<R>,
+        handler: impl FnOnce(u32, u32, &[u8], &[u8]) -> Option<R>,
     ) -> Result<Option<R>> {
         self.inner.lock().receive_gmc_and_dispatch(timeout, handler)
     }
 
+    /// Sends a GMC API command to the GSP without waiting for its response.
+    ///
+    /// A caller that expects a response reads it with [`Self::receive_gmc_and_dispatch`], which
+    /// lets it handle the events GSP-RM interleaves before the response arrives.
+    ///
+    /// # Errors
+    ///
+    /// - `EMSGSIZE` if the command exceeds the maximum queue element size.
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the command header is not properly aligned.
+    pub(crate) fn send_gmc_no_wait(
+        &self,
+        bar: Bar0<'_>,
+        command_id: u32,
+        payload: &[u8],
+        max_response_size: u32,
+    ) -> Result {
+        self.inner
+            .lock()
+            .send_gmc(bar, command_id, payload, max_response_size)
+    }
+
     /// Waits for an unsolicited GSP event of type `M`, dispatching any other event that arrives
     /// first.
     ///
@@ -1005,7 +1026,6 @@ fn send_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result<u32>
     /// - `EMSGSIZE` if the command exceeds the maximum queue element size.
     /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the command header is not properly aligned.
-    #[expect(dead_code)]
     fn send_gmc(
         &mut self,
         bar: Bar0<'_>,
@@ -1387,9 +1407,13 @@ fn wait_for_gmc_msg(&self, timeout: Delta) -> Result<GmcMessage<'_>> {
 
     /// Receive the next GMC event from the GSP and dispatch it through a handler.
     ///
-    /// The handler receives the GMC command id and the raw payload slices that follow the
-    /// [`super::fw::GmcApiHeader`] (two slices because the circular buffer may wrap). It returns
-    /// `None` for an event it does not handle.
+    /// The handler receives the GMC command id, the header's `max_resp_or_status` field, and the
+    /// raw payload slices that follow the [`super::fw::GmcApiHeader`] (two slices because the
+    /// circular buffer may wrap). It returns `None` for an element it does not handle.
+    ///
+    /// `max_resp_or_status` is a union: GSP-RM writes an `NV_STATUS` there when the element is a
+    /// response, and the maximum response size when it is a request. Only a handler that knows
+    /// which one it asked for can read it.
     ///
     /// Where [`Self::receive_msg`] keys on [`MsgFunction`], this keys on the GMC command id,
     /// which is the form the r000 firmware uses for boot events.
@@ -1405,7 +1429,7 @@ fn wait_for_gmc_msg(&self, timeout: Delta) -> Result<GmcMessage<'_>> {
     fn receive_gmc_and_dispatch<R>(
         &mut self,
         timeout: Delta,
-        handler: impl FnOnce(u32, &[u8], &[u8]) -> Option<R>,
+        handler: impl FnOnce(u32, u32, &[u8], &[u8]) -> Option<R>,
     ) -> Result<Option<R>> {
         let message = self.wait_for_gmc_msg(timeout)?;
         let header = message.header;
@@ -1437,7 +1461,12 @@ fn receive_gmc_and_dispatch<R>(
                 length,
             );
 
-            handler(command_id, message.contents.0, message.contents.1)
+            handler(
+                command_id,
+                header.gmc.max_resp_or_status,
+                message.contents.0,
+                message.contents.1,
+            )
         };
 
         self.gsp_mem
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 0c3832ccf726..d55faf1a4e04 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -20,6 +20,7 @@
 };
 
 use crate::{
+    driver::Bar0,
     gpu::Chipset,
     gsp::{
         cmdq::{
@@ -32,13 +33,18 @@
             self,
             commands::{
                 GspInitRequest,
+                GspInitResponse,
+                GspInitResponseSchema,
                 RegKey, //
             },
-            MsgFunction, //
+            MsgFunction,
+            GMCAPI_CMD_GSP_INIT, //
         },
         nvkv::{
+            Decoder,
             Encodeable,
-            Encoder, //
+            Encoder,
+            UnknownKeyPolicy, //
         },
     },
     sbuffer::SBufferIter,
@@ -311,6 +317,136 @@ pub(crate) fn build_gsp_init_payload(
     Ok(encoder.finish())
 }
 
+/// Size of the buffer GSP-RM may fill with static configuration, matching the allocation Open RM
+/// makes in `kgspSendInitRpcs`.
+const GSP_INIT_MAX_RESPONSE_SIZE: u32 = 48 * 1024;
+
+/// Sends `GSP_INIT` and returns the static configuration its reply carries.
+///
+/// GSP-RM interleaves load-and-execute events between the request and the reply, and those events
+/// drive the falcon loads that let it finish starting, so each one is passed to `on_boot_event`
+/// rather than skipped. The reply arrives only once GSP-RM is up, which is what makes it the
+/// signal that boot is complete.
+///
+/// `payload` is the blob from [`build_gsp_init_payload`].
+///
+/// # Errors
+///
+/// - `EIO` if GSP-RM reports a failure status, or if the reply is not a whole number of NVKV
+///   words.
+/// - `ETIMEDOUT` if neither the reply nor another element arrives within
+///   [`Cmdq::RECEIVE_TIMEOUT`].
+///
+/// Errors from `on_boot_event` and from decoding the reply are propagated as-is.
+#[expect(dead_code)]
+pub(crate) fn gsp_init(
+    cmdq: &Cmdq,
+    bar: Bar0<'_>,
+    payload: &[u64],
+    mut on_boot_event: impl FnMut(u32, &[u8]) -> Result,
+) -> Result<GetGspStaticInfoReply> {
+    // Qualified because `zerocopy::IntoBytes` also gives `[T]` an `as_bytes`.
+    let payload = AsBytes::as_bytes(payload);
+
+    cmdq.send_gmc_no_wait(
+        bar,
+        GMCAPI_CMD_GSP_INIT,
+        payload,
+        GSP_INIT_MAX_RESPONSE_SIZE,
+    )?;
+
+    loop {
+        let reply = cmdq.receive_gmc_and_dispatch(
+            Cmdq::RECEIVE_TIMEOUT,
+            |command_id, max_resp_or_status, payload_0, payload_1| {
+                if command_id == GMCAPI_CMD_GSP_INIT {
+                    Some(decode_gsp_init_reply(
+                        max_resp_or_status,
+                        payload_0,
+                        payload_1,
+                    ))
+                } else {
+                    // A boot event. Keep waiting for the reply unless handling it failed.
+                    match on_boot_event(command_id, payload_0) {
+                        Ok(()) => None,
+                        Err(e) => Some(Err(e)),
+                    }
+                }
+            },
+        )?;
+
+        if let Some(reply) = reply {
+            return reply;
+        }
+    }
+}
+
+/// Decodes the `GSP_INIT` reply, whose `max_resp_or_status` field carries an `NV_STATUS`.
+fn decode_gsp_init_reply(
+    status: u32,
+    payload_0: &[u8],
+    payload_1: &[u8],
+) -> Result<GetGspStaticInfoReply> {
+    if status != 0 {
+        return Err(EIO);
+    }
+
+    decode_gsp_info(&nvkv_words(payload_0, payload_1)?)
+}
+
+/// Joins the two halves of a wrapped payload into the `u64` words an NVKV stream is made of.
+///
+/// # Errors
+///
+/// - `EIO` if the combined length is not a whole number of words.
+/// - `ENOMEM` if the buffer cannot be allocated.
+fn nvkv_words(payload_0: &[u8], payload_1: &[u8]) -> Result<KVVec<u64>> {
+    let bytes = SBufferIter::new_reader([payload_0, payload_1]).flush_into_kvec(GFP_KERNEL)?;
+    let words = bytes.chunks_exact(size_of::<u64>());
+    if !words.remainder().is_empty() {
+        return Err(EIO);
+    }
+
+    let mut out = KVVec::with_capacity(bytes.len() / size_of::<u64>(), GFP_KERNEL)?;
+    for word in words {
+        let word: [u8; size_of::<u64>()] = word.try_into().map_err(|_| EIO)?;
+        out.push(u64::from_le_bytes(word), GFP_KERNEL)?;
+    }
+
+    Ok(out)
+}
+
+/// Decodes the static GPU configuration from an NVKV stream.
+///
+/// # Errors
+///
+/// - `EINVAL` if the stream is malformed or omits a required key.
+/// - `ENOMEM` if the decoded regions cannot be allocated.
+fn decode_gsp_info(words: &[u64]) -> Result<GetGspStaticInfoReply> {
+    let decoder = Decoder::new(words, UnknownKeyPolicy::Ignore);
+    let decoded = KBox::try_init(
+        decoder.decode(GspInitResponseSchema::default())?,
+        GFP_KERNEL,
+    )?;
+
+    let mut gpu_name = [0u8; GspInitResponse::MAX_GPU_NAME_LEN];
+    let name = decoded.gpu_name();
+    gpu_name
+        .get_mut(..name.len())
+        .ok_or(EINVAL)?
+        .copy_from_slice(name);
+
+    let mut usable_fb_regions = KVec::new();
+    for region in decoded.usable_fb_regions() {
+        usable_fb_regions.push(region, GFP_KERNEL)?;
+    }
+
+    Ok(GetGspStaticInfoReply {
+        gpu_name,
+        usable_fb_regions,
+    })
+}
+
 pub(crate) use fw::commands::PowerStateLevel;
 
 /// The `UnloadingGuestDriver` command, used to shut down the GSP.
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 89482d2648f5..9a44a1409fb4 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1012,6 +1012,10 @@ pub(crate) struct GmcApiHeader {
 /// `GMCAPI_HEADER_COMMAND_ID_MASK`. The remaining byte carries flags.
 const GMCAPI_COMMAND_ID_MASK: u32 = 0x00ff_ffff;
 
+/// GMC command that hands GSP-RM its system information and registry keys and returns the static
+/// GPU configuration. Its reply is also what signals that GSP-RM has finished starting.
+pub(crate) const GMCAPI_CMD_GSP_INIT: u32 = r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_INIT;
+
 /// GMC command asking the driver to run the generic falcon bootloader against a descriptor the
 /// GSP supplies.
 pub(crate) const GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER: u32 =
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index c9deee8d23c8..f41b626ad6d1 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -428,7 +428,7 @@ pub(crate) fn new(
     /// Schema for the `GSP_INIT` response.
     #[cfg_attr(not(CONFIG_KUNIT), allow(dead_code))]
     #[derive(Default)]
-    struct GspInitResponseSchema => GspInitResponse {
+    pub(crate) struct GspInitResponseSchema => GspInitResponse {
         gpu_name:
             Array<u8, { GspInitResponse::MAX_GPU_NAME_LEN }, { Self::GPU_NAME_STRING_KEY }>,
         fb_regions: Accumulated<FbRegionSchema>,
@@ -446,7 +446,7 @@ impl GspInitResponseSchema {
 
 /// Payload of the `GSP_INIT` response.
 #[cfg_attr(not(CONFIG_KUNIT), allow(dead_code))]
-struct GspInitResponse {
+pub(crate) struct GspInitResponse {
     gpu_name: ArrayVec<u8, { Self::MAX_GPU_NAME_LEN }>,
     fb_regions: KVVec<FbRegion>,
     bar1_pde_base: u64,
@@ -454,7 +454,36 @@ struct GspInitResponse {
 }
 
 impl GspInitResponse {
-    const MAX_GPU_NAME_LEN: usize = 64;
+    pub(crate) const MAX_GPU_NAME_LEN: usize = 64;
+
+    /// A region with no tag is general-purpose memory. A tagged region is reserved for a
+    /// firmware-internal use that the tag identifies.
+    const FB_REGION_TAG_NONE: u32 = 0;
+
+    /// Returns the GPU name, which GSP-RM sends with its NULL terminator.
+    pub(crate) fn gpu_name(&self) -> &[u8] {
+        self.gpu_name.as_slice()
+    }
+
+    /// Iterates over the FB regions the driver may allocate from.
+    ///
+    /// A region qualifies when it is untagged, unprotected, and supports both compression and
+    /// isochronous access, which is the same set the RPC path selects from
+    /// [`GspStaticConfigInfo::usable_fb_regions`].
+    pub(crate) fn usable_fb_regions(&self) -> impl Iterator<Item = Range<u64>> + '_ {
+        self.fb_regions.iter().filter_map(|region| {
+            if region.limit >= region.base
+                && region.tag == Self::FB_REGION_TAG_NONE
+                && !region.flags.protected()
+                && region.flags.support_compressed()
+                && region.flags.support_iso()
+            {
+                region.limit.checked_add(1).map(|end| region.base..end)
+            } else {
+                None
+            }
+        })
+    }
 }
 
 nvkv_decode! {
-- 
2.55.0

