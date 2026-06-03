Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012032.outbound.protection.outlook.com [52.101.43.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440E637DE80;
	Wed,  3 Jun 2026 01:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450892; cv=fail; b=VyBZlaU1X10MHWnocny/tU5F2DCVqr+9TkTkHIil4w4XIA9II4zpEnQlLsCUTt9pCW5yljfQChhTR7jLz5YybJgHBbdDpkPJo5cMU20XUhQYSegy15p2I6kHTiPJ9IXw8sB1DXxpnbCR2UdIU4xCtLAd8dhrU0humxDOXB727so=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450892; c=relaxed/simple;
	bh=pvLec3Uxcl89nSagELDPEP49qA1v3fR6WlRqbeIAK6A=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=a9AoKokBxq2wcttLckCaDpyfE2TzJfCzFzfajiGc//DtxHzp5TjSVz4C9Vv6A1D4feyx+EGkQQL430gphyFV4LJFue+tNRW9WiYMa26WUQt41h8ykPE4/hGUywJY8p618sVYxafl0LECRVK7EKOUna52jtQE2lMn7s0uKP93vtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lYoxiMKF; arc=fail smtp.client-ip=52.101.43.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lYoxiMKF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzskI07mcFIXnW1xOnPAbrBfWCTy4j+h/tbv8npbwbKxBFQEt5iAbg6bPWUn5mEcfcyfpbPoGq4y73GjI+/5dg1ivE1uCeAsoSe6Nwa2P9ubJ/vKZfC0HpqmAaxW5Xt4Dy91/wbAPRrh3DxWZ7yokQKeEIe4cX7r350w6nEOptc8YckplpFqR+iRhq7BVsLnNMN+Ya2+mzeTTgKIryPRkEyFGg1MVzjxGz8buSBoCMGuE6dSeExf/aeGZDlHTbyIRW/3lG95eMLR4caM7VljooVkYzFCyUXfuYlSbot1TTzrAn6456mz5MuSVsx7oq5+kwM5MHZIbEMdbz0GOO3Q+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hikckowSavmgSbBvOqGD7ToSSHGVJErsVFnlX91znrY=;
 b=OekRxR6BG2VvI3Zvu4G10Y3IUzntUAdST1JPcC6J+CsfGS/SEYJSi/6MxFI1blGaZnrWdD1W2rS1af5P3XtxTQg+G1skqULly9bt8LojCNRSUusqPmFekk0Wu8EvhpAnCrMVAO9mKY5wUY/C4qWhaPoY91yPDUMk0TozSXe+/yWJCsxPCOnjMQDQ3uaPlxcdaXJKoKouVG8OgvlLfjDnAckE1pOEpour4aWkszjWbAm5ssLkMS9BkicOtTEy7X0U0Jks7rrjpwe2cuasuz0RUSkL4ZguOgrkmDfhuszDv/zJv3f0XwRT/JvNK0Me3AZmMChLyy86nfYreeS6AVJzVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hikckowSavmgSbBvOqGD7ToSSHGVJErsVFnlX91znrY=;
 b=lYoxiMKFLQnzGVR0qNVJ6g3uGXhRzvjt971VSWKSFQQ9x305vRKuXcCUCSfoNmxKhUDTBrmIXZhXhNMfhqW26mCtaxQ4N4R8jhAGZleaAVmibIMi8c6Ey6faApucD3MbmLCO7iruGikWFq8UJxYvSa7Iqpp2W1UEuiJhczoQQL2SqKIVwJXTQzbndXa6QA1yx3eqjg1d9mTaVuG4phPJqMiw/a2Z6NFbTfGo/02+DKLfrJk/SHOTLqzdCIWs+nurP7aEX2dqFAd7iJAmoH+2m9hKXgCegQE9bqjSC9zmoxRXsLnz5pZDkZBXQCsRUbLUWikgdej3j9R6sPDI/dbmfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN1PR12MB2368.namprd12.prod.outlook.com (2603:10b6:802:32::23)
 by SJ1PR12MB6361.namprd12.prod.outlook.com (2603:10b6:a03:455::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 01:41:24 +0000
Received: from SN1PR12MB2368.namprd12.prod.outlook.com
 ([fe80::281e:52ee:b18e:ad42]) by SN1PR12MB2368.namprd12.prod.outlook.com
 ([fe80::281e:52ee:b18e:ad42%7]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 01:41:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 10:41:16 +0900
Message-Id: <DIZ15SUHLC92.30Q5BYTGX9YSU@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Benno Lossin" <lossin@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Eliot Courtney"
 <ecourtney@nvidia.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Timur Tabi" <ttabi@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Alistair Popple" <apopple@nvidia.com>, "Gary Guo"
 <gary@garyguo.net>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "David Airlie" <airlied@gmail.com>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 15/22] gpu: nova-core: Hopper/Blackwell: add FSP
 message infrastructure
From: "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602032111.224790-16-jhubbard@nvidia.com>
 <20260602033358.5F2B71F00893@smtp.kernel.org>
 <DIZ0LJNPWG9L.1WJCBXNFIUU1V@nvidia.com>
In-Reply-To: <DIZ0LJNPWG9L.1WJCBXNFIUU1V@nvidia.com>
X-ClientProxiedBy: TY4P301CA0098.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::18) To SN1PR12MB2368.namprd12.prod.outlook.com
 (2603:10b6:802:32::23)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PR12MB2368:EE_|SJ1PR12MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd3d944-7271-4cd0-a324-08dec11138a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|6133799003|11063799006|5023799004|4143699003|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	PNOgtqsugzVPv2eGJv9Ffqi2QecE4R+ju+5eTZVrUVmEHgMHq0Urb36Jmhg71vjkPvbqHYmS05H0vgPPgQAetQuI7ZK0bKAli3r1DGbj2O5Erc+NDXD3L7V1/wsqvkMWUhGTojl/kZKObzI5lOr2Fp1Q9HApDdc7Y4ipie9gs/uBhJiocNNWgKTn4ozOXx3aiyUF5EcDYp5wGzS3fLBwXFlvIwC6XOAZ5mk85t6lFtDBBzYq3MOa3DtEbeSVIsaaN2k18s6CQUM1lC6ZagB6Sngk0UfDQEZbudhd4J4EiC8X82LFiReM3G33T+BNItt/V/sPLXEygbrnd4Yxsj6iB9S/70SwV2XOXzgfuTcPRYrF23p5LmNZiROjbRqVS4ytOQSueDjFsZQJDdnPd50yTkcH38UZN68p8LEFRHoyd6SYmPto+xwZzQK4K4cMPbialmVINhi+9sR9ARQVF+PavQ5KfZ4R0Am11kaZZfYVf8AhHMCNGc/k7veyn7KrYf9nwEQnR9XbImB0+PVyzJIwTWacT+fksoIMfWxRYxdv4xh+54BLxaqX1DOGdmAXrOprBJE0R5OsVymVpXsdnkWGMe74aAjFuSzbCJwKT7GoX8b71qPWRwwQJyt3dcUrfSx4uDn4WC09wbD/X+NPRixjvVO6ZKmqbB8A6IHSucjarTH0HGUGO+AjUStfYktyPTx8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2368.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(6133799003)(11063799006)(5023799004)(4143699003)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFY4RnQ4NHVrZWxSckwrcEtLZUNRb25Yd3RoRmM2UEhHNGJWODlQNjhBeG9i?=
 =?utf-8?B?UUp6bjljd3RjWUlWNVA2bk9TeHhnd2RHdmdqYnRUeGx4dG5Gczk0NHRlR2tt?=
 =?utf-8?B?c3hmS0pYWFFyejFwaE1Za0FKaytRZmo1WUVWaDBwdFUrc2JCVW04dytDbFF4?=
 =?utf-8?B?N0Yxem1aSGZrRGFFRWZOd2dsUUhtUlhPVkxqWmVwZWFobjFpSG1EOThvUUFD?=
 =?utf-8?B?Wkh1WFV3SjUvNisxS3YwTGd3aVliWFlTLzBGNXBCZGJwUTJ5bys3RFZCYWN3?=
 =?utf-8?B?RGh0Uk96SzNMcXowc2RVL1BWSjZYcVJpRkM3MmtMN2ljd05qd01KMFVvZ0t1?=
 =?utf-8?B?UTF6dWRsdm9Vc3ZlY055V0RCWC9QYlIxUkwxRHNkRDlyd29DYUJ0OS81VXRu?=
 =?utf-8?B?eS90ODJ2S21Eelluajh5Tyt2TXJHazVTenAwTWpBYnRTSWVnWjFxUFR4bjRR?=
 =?utf-8?B?OU9VNEVXdnZDeWhrN0tmUmwrVkpXbjUrMFF1eCtPMTB2ZEVGT3B2YlZQQWpk?=
 =?utf-8?B?VU05M0FDSXhqM1kzb0RYRmo5Vkc4VHJFc1lZSXlwK3RRdHNjaUdocWk3MmMz?=
 =?utf-8?B?QVVlZDV4V0J5ZEJSK2RPRnNodHd5Z3lQREdMVk5XUGxtcmhJYi95bllwWmYx?=
 =?utf-8?B?TUhOcnNwNXJEU0RPbTcrckF5dUIwQ3d1d2JzQjNpSm9nNVJXYWowV0xGQjUy?=
 =?utf-8?B?UDdRWnBwbFVzRDNhNmRiT3ExR1EzYjVybXZsaUJucjRXNjI0LytPSTZCS0pr?=
 =?utf-8?B?M2JjRjNjUFk1NmZEQ0tkZHg0K0FrbHovUHdwOTN1TUhXRkF0UUJDb0NnSkxi?=
 =?utf-8?B?YkJ0TFNrV0s1aUdZZFZPczVSdVFKVmJxSE9EYnFZNm5PZXMvVGpzb2JKVXNm?=
 =?utf-8?B?amd4MVR5S3ExeW5tM3FBNUZPRmJiZjlTQnUzSEtXalZvNU53SGhGWnhZOVJK?=
 =?utf-8?B?NmhkQS8vazFUL1VJY2c2ZVlPZFRzbm5ORzZhanlBUVpITlNIMjh5bWxlZEhG?=
 =?utf-8?B?WjZkYTROcTcraGFOWGlRNnRwRWxMOWdWRDEvN1k3RE1yMUR1UFVEWFZOSEJ1?=
 =?utf-8?B?WWYrd09lNndEaEt4SlZId0UxTmhZSko4QkV2N1ZUSVVISEc0Y010SkNKeEhD?=
 =?utf-8?B?YTRZVjkxODJ3Y01tdmhOOW1uTFY1d2xES05pR2tPSHdZN3pDVElyWmZLdG5B?=
 =?utf-8?B?a0tjanJ1bXNkLzVTR1ZUTzI3RlJTajNFQ1R0QXdnTG0vZVU0ZXE3czVJWVFy?=
 =?utf-8?B?ald2Qm1kWlRwU2Z0QjVXUWNZSHZ5T0pmOEp0WWJ1R3hGZm84SUpDUlUwek1E?=
 =?utf-8?B?QnZROEdqQ3JJd2lhNVNhYUR0M1IxQ1RzRGsyMUpmVTBJcjNhWmMrT2Yvd1Jw?=
 =?utf-8?B?T0xrNTdFL0ZoalBwL1hIQVRhcEd5cncvYlI0S3YrVSt0ZWhrc21OZlVtNGV5?=
 =?utf-8?B?dHZXekhObjFHZzJpZEZJZlJYVjhxS1FkL3ZSN2tWS2RXTkNKZXV1R0hQeTll?=
 =?utf-8?B?QmQwZEpkTWNDb3F5alZLSnVoNStlRldGbGkzNkxzRmdVbVd1bk95TksweG0z?=
 =?utf-8?B?b1pVS1ArSlA2VWgvUFErcmcyS0dUM2ZmSnJNZDYxT2hvcGY4dkY1b3FBZXQw?=
 =?utf-8?B?d091OFJYV1NwL0pZb0hmek42Ly9yb29qb1hpdGVuRURGZ01tbGdCR1VJaHNq?=
 =?utf-8?B?TThkV2tBejNOcjV6Q2JPQVFsNVZIdS9hYTlHY2ZRanFhcE9WZzkvc0NrT3Vt?=
 =?utf-8?B?REl0YUU1eVl0ZDI5RFhJbENhMjJOUUNLbjlxaC95MHMwMU5TcXZzTlpPMmJp?=
 =?utf-8?B?cUQ1U1hTbTNRcWtlTktpR1d5UHZFYlhuWHc0VDgxZDhNRXNNd0kxVW0ySVdz?=
 =?utf-8?B?bmJaT3J2UXBncWoyQk8vTlY0R3pxMlk3T253L0sxa0Nxd0kxYUF0bW4xUmkr?=
 =?utf-8?B?MkYrcnJ3NENnOXdYNmhPYkxhM3BvdVNKcUQwMENrYW9wQUw2eDdVT3YzYkk2?=
 =?utf-8?B?T04zeW1EMkVxR21HR0doeTcrV2V2UFRpc3gzRW0zSWxyTUQ5dFJtbW1pMkdO?=
 =?utf-8?B?dFExWHJNVXpCTzRyUG55VHhyQlFJN1Y5Vk1YVytjMzBJK1Jkc2o2Zy9jdmVF?=
 =?utf-8?B?UGpvREErSkdEUDJPNDlUSzh4UStNc0xWcDVxUkhST3pyOWhueFFRSW5DUW1v?=
 =?utf-8?B?MkRrLzZUN2ZCRmtqUmk5ZTRpS3JyeEd5RzJBbFJYK3BpNEFkYmFwblNuYUFZ?=
 =?utf-8?B?MnlIbFpmdlA5SjJKWllkN1lUclhzSlBxYzg0VXFQdmVJWFRVUWQ5SzVxQ1Ux?=
 =?utf-8?B?amFXT3lpYytkVERKc0k1eU5PdVlVSk5VYUR2bExHb09tdUJVQ1hUS05SVDFy?=
 =?utf-8?Q?PecPyNmbHytjkQNNo/87a8Jym1jQ/ZqH0j5ILUOg4Hh/y?=
X-MS-Exchange-AntiSpam-MessageData-1: cnE0CQekWPM3GA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd3d944-7271-4cd0-a324-08dec11138a2
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2368.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 01:41:24.3275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xX4qGhT2orXpvcMeJbn3zxWOt2UsgP8yQp51WuAFIxiAGQITbOrB3z1tXH95eTmua4KWNwHj40rLC99xPt1t3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6361

On Wed Jun 3, 2026 at 10:14 AM JST, Alexandre Courbot wrote:
> On Tue Jun 2, 2026 at 12:33 PM JST, sashiko-bot wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential iss=
ue(s) to consider:
>> - [High] Race condition due to incorrect order of writing queue pointers=
 in `send_msg`.
>> - [High] Silent failure when sending a 4-byte message.
>> - [High] Unchecked integer addition in `poll_msgq` can cause a kernel pa=
nic on untrusted MMIO reads.
>> --
>>
>> commit 8a59b49984011320aa631b20a05550242e2baef2
>> Author: John Hubbard <jhubbard@nvidia.com>
>>
>> gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
>>
>> This commit adds the foundation security processor (FSP) message
>> infrastructure for the nova-core GPU driver. It implements queue
>> registers and low-level helpers to communicate with the FSP falcon's EME=
M.
>>
>>> diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-cor=
e/falcon/fsp.rs
>>> index 6b057d958115a..0ec1c55213bc8 100644
>>> --- a/drivers/gpu/nova-core/falcon/fsp.rs
>>> +++ b/drivers/gpu/nova-core/falcon/fsp.rs
>> [ ... ]
>>> @@ -145,4 +143,63 @@ fn read_emem(&mut self, bar: &Bar0, offset: u32, d=
ata: &mut [u8]) -> Result {
>>> =20
>>>          Ok(())
>>>      }
>>> +
>>> +    /// Poll FSP for incoming data.
>>> +    ///
>>> +    /// Returns the size of available data in bytes, or 0 if no data i=
s available.
>>> +    ///
>>> +    /// The FSP message queue is not circular. Pointers are reset to 0=
 after each
>>> +    /// message exchange, so `tail >=3D head` is always true when data=
 is present.
>>> +    #[expect(dead_code)]
>>> +    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
>>> +        let head =3D bar.read(regs::NV_PFSP_MSGQ_HEAD).address();
>>> +        let tail =3D bar.read(regs::NV_PFSP_MSGQ_TAIL).address();
>>> +
>>> +        if head =3D=3D tail {
>>> +            return 0;
>>> +        }
>>> +
>>> +        // TAIL points at last DWORD written, so add 4 to get total si=
ze
>>> +        tail.saturating_sub(head) + 4
>>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>> [Severity: High]
>> Can this unchecked addition panic if we encounter a PCIe link failure?
>>
>> If `head` reads normally as 0 but a surprise removal occurs before readi=
ng
>> `tail`, `tail` could read as 0xFFFFFFFF. The saturating subtraction woul=
d
>> leave 0xFFFFFFFF, and the subsequent `+ 4` will overflow, causing a pani=
c in
>> debug builds where CONFIG_RUST_OVERFLOW_CHECKS=3Dy is set.
>>
>> Should this use `saturating_add(4)` or another form of checked math to h=
andle
>> untrusted hardware inputs safely?
>
> This is cheap to fix, and indeed probably a good idea.
>
>>
>>> +    }
>>> +
>>> +    /// Writes `packet` to FSP EMEM and updates the queue pointers to =
notify FSP.
>>> +    ///
>>> +    /// Returns `EINVAL` if `packet` is empty or its length is not 4-b=
yte aligned.
>>> +    #[expect(dead_code)]
>>> +    pub(crate) fn send_msg(&mut self, bar: &Bar0, packet: &[u8]) -> Re=
sult {
>>> +        if packet.is_empty() {
>>> +            return Err(EINVAL);
>>> +        }
>>> +
>>> +        // Write message to EMEM at offset 0 (validates 4-byte alignme=
nt)
>>> +        self.write_emem(bar, 0, packet)?;
>>> +
>>> +        // Update queue pointers. TAIL points at the last DWORD writte=
n.
>>> +        let tail_offset =3D u32::try_from(packet.len() - 4).map_err(|_=
| EINVAL)?;
>>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>> [Severity: High]
>> Does this create a silent failure if a 4-byte message is sent?
>>
>> If `packet.len()` is 4, `tail_offset` is calculated as 0. Both NV_PFSP_Q=
UEUE_HEAD
>> and NV_PFSP_QUEUE_TAIL will then be written as 0. Because the FSP protoc=
ol treats
>> `HEAD =3D=3D TAIL` as an empty queue, the FSP will ignore the message wh=
ile the
>> function still returns `Ok(())`.
>>
>> Should this enforce a minimum packet length of 8 bytes or return an erro=
r
>> for 4-byte messages?
>
> This one looks bogus (looks like the claim that `HEAD =3D=3D TAIL` means
> empty queue is hallucinated?).
>
>>
>>> +        bar.write_reg(regs::NV_PFSP_QUEUE_TAIL::zeroed().with_address(=
tail_offset));
>>> +        bar.write_reg(regs::NV_PFSP_QUEUE_HEAD::zeroed().with_address(=
0));
>>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^
>>
>> [Severity: High]
>> Is there a race condition with the FSP hardware due to the order of thes=
e
>> writes?
>>
>> By writing NV_PFSP_QUEUE_TAIL before NV_PFSP_QUEUE_HEAD, if QUEUE_HEAD w=
as
>> non-zero from a prior transaction, we momentarily create a state where
>> `TAIL !=3D HEAD`. The FSP may wake up immediately and read from the old,=
 incorrect
>> QUEUE_HEAD offset before the driver can write 0 to QUEUE_HEAD.
>>
>> Should NV_PFSP_QUEUE_HEAD be initialized to 0 before writing the
>> NV_PFSP_QUEUE_TAIL doorbell?
>
> Here IIUC QUEUE_HEAD is always `0`, so this is a non-issue.

AFAICT FSP looks at the queue when HEAD is written to (so MMIO
triggered) which means that HEAD=3D=3D0 && TAIL=3D=3D0 is possible to repre=
sent
a 4 byte send, if you disallow sending a 0 byte message. This also means
that there's no race condition here as long as you write HEAD after
writing TAIL (and you must write HEAD as 0 even though it is always 0 to
actually send the message). OTOH, I don't think FSP can ever send back 4
bytes, since that is impossible distinguish from nothing on the CPU
side.
