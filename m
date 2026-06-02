Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3666A2857EE
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 14:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780412147; cv=fail; b=eiFUF9pX8G8W2ZSHvVbmXsq1xZR8zs7B8I4N1Ngg/51ByrGvvt30ToIzl8C8cB7iQ+712w02636DAW+lnn/AkETveE2MX7IIauhDRoAxjM+YWbdK1ecXJ6a2XYbzRLnQo8ssmu7V+BG0ECgOEGwxxOTQSbmyMtJZDX7mh4ZURCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780412147; c=relaxed/simple;
	bh=7db2/THU/MJxP92QyMjiB+VSfXpnWQTTgPzLZCHSObo=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=rEAN+ZnRDr0VokJbSaYp/zaqqeuBZWXr1VT37EJQfzWTEp9XqNMKGP+hnnsaAfHaBNMrJMOZdETW+7wf5MNMwkwMpG0HJ1yA9DbGSfO2yvRPX+lYS2eDfwjWY2FnecZbazIDvKy9jHO+jAaY0yHT4TpX43DeNFphCnobSEHC84c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Kn53XdIz; arc=fail smtp.client-ip=52.101.46.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kn53XdIz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/9k7jZRRyTtsCma9RkuDHGiCURN6mkV9bIBxLkSzMldrwCFhd7YLiSitNOecNBJfrJIvwHWi1XydEVSyg7BLvG295wwcRxIYyK9ZJcT6YP6cnZRVBLSPQJNooBwMr6p34ydAbDXVTHSq1mlrq3y91G5FLOkB8PSmJTX7JUOG1mkoYr8mVMMVGZsqls47QK43sD3VjPChpiu57vB7Exz9gGa7d6vuT8hfZ6ryMTm69qmXqLFe2rYwCOP2W2BM/Fx8S9K8SVbTlcbEX+YwTWcO4Xg0SA7WVxhSoUjTIvrPcVYix51ShdkvSxUBwpHyrl0gerJAp+/8A/MdjZLaq7wcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FeKTcp8UUVNwXf+UDS5i9AVJG2qG5JF36/WU/SWnoBI=;
 b=C9nNBWJwQICABqMUlm6UyyvjWH3eOQVK1/bjJzKty3XgbYKY0MHZivbwi4lvDTkq2MQSOxT4ClyVlWplgBnp0XGYgKSTFxjy04SszE6eS5FxsVzzlqt6u5Z1oSXri8+WiP3DDcMYD9nDmRm6gedPdQlHykRx38ZAw2LwbJxUMGHB4S3w/AlLKJYZ2+/Ia3eG+yS7U7rmg5Xqlh1/nCtZ38EE2r4FVWoDPRT8+kOsgWWOEwCLCJKhVWXMw7q4jVHfLKtRae8E8MwnokMGq3+jW7OufRBgvGvU1zzPj+otvHc5TctivhKqR+w0abY8cpHSqGABplnxT1OibwuCQkjvLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeKTcp8UUVNwXf+UDS5i9AVJG2qG5JF36/WU/SWnoBI=;
 b=Kn53XdIzY9fY9g5lM2XbrM5nSeibr3yXSJ3h1zF+4FWGx0j3rHGomS3w3EgaKQsmOxNSBfp7Dmbn00z+kpn7UwiaDjRFDiOGg3YwniaWYkENGlzUk4AzlVjxC8AESzw0EIg4gAWRtlJBXhTP3I6vG5DjGovRBhW9Ndw3UdHyw6WZgNHwIjTj4jv9zmT+Fs7TJBcpDeYuz9zx4IrMX7AtmsqQI7bXHUOP+2yE5GlcNM1yd2kdkqWFsfubwHjozamI6vhucC+Sm0QlbHF4elNLdv8NXcJd8us1b86eLzeA0FHbNHbzERyPdumJRz4z3gsfyqnpdEC6Y2jdez4ztxCUUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6272.namprd12.prod.outlook.com (2603:10b6:208:3c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 14:55:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 14:55:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 23:55:34 +0900
Message-Id: <DIYNFF83OHGY.2SQO4U6D3HD98@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 14/22] gpu: nova-core: Hopper/Blackwell: add FSP
 falcon EMEM operations
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-15-jhubbard@nvidia.com>
 <DIYJBADZIEO6.16PWR47AXTG5S@nvidia.com>
In-Reply-To: <DIYJBADZIEO6.16PWR47AXTG5S@nvidia.com>
X-ClientProxiedBy: TY4P286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: b8d21972-3a61-4f2f-f330-08dec0b70222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|366016|376014|18002099003|4143699003|11063799006|10063799003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	SnmxL6isFC9P10k+l7czWTzP3nJFY7i4ULteBNua6c7USPIBQsqw8BHPjLcJQYGclQ2khbM78LI+Xw1/i3YeVN3jNjCGXEI0bOdZ6BRd1j/rBjbcjI5zAxNx5IJEPMZLN9UGfqA8epwUR7slP1SODyJcY1jJrYYx+HftjK1owSSnJEWxtVNqJN8x+DmIYbRu3LSisexX1kScCjojTPQ0KYkpEwbQdBmYBye4NJzIRLZ2qNBwKaJW2/lw+Kh0Iyz/29EEOYbbarHx8k3q8lCKG2NUa8FI4/o0OEL5Q/JspSD4CmQBzES9aYwMPLKqaIv99Vc4d4Xla6+TBz6Ywr+JR4K2cEiKCQOYVeLSz8uaMAbHWJt8A8Nx+/W+DLbC7EB4mqxyrUxloYsLRWkwuYcDscCZg7pdx8Hil67QCoQ4RqYUlRcG+dKK1A/N8CwObNUVwERrehIzuiUM3BF8Qh7NUkXxkvAUFGmdSGKgACKV0WA6j96RiOAjO0iHtowqdaYCV3BRllmb1Gs3hHxSXosMtGLF9Z8TldwFT3HnKyxHJpsYXsfchfeZw3NcsvG1+tcNaQJGWOJUnHpJkaU53Jud9kG+fuT1dDPEVRXU5Zi1Hk7FiZar/cDaFe9o7sANct8QWvkjTpCUKnkjzc1laBOrv/f1cGoRG7UuJ8FWV4YPzbESdQVm5U3497+MgNrtu57X
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(366016)(376014)(18002099003)(4143699003)(11063799006)(10063799003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1grVmE3UEdHOEpLbzZPZ3RWbTZPUFJTbHVNbGlRVXNRNU5XNlVuNFA0d09w?=
 =?utf-8?B?Rnc1OHV3QzJhemtEaWovam05V1hiNWh2ak40QkhYeXI0ZzJ1UWx5aUQvVHUz?=
 =?utf-8?B?VjFCc0QvWVBkQ1NxU2hENUhCVFhudmJTMjF4enNSNDZGTTVKRnJjaUJCdi9M?=
 =?utf-8?B?N2M1T1JCdjBNMUJaODUzMUhlRDNOZGJHVi9CNEZzR3ZZdFNsY1ZHSnQ0Smxn?=
 =?utf-8?B?MytTYTNMdnVOOHRDWkRoa2twL2lGaXI4MVBnblB0ZkNFd2pPUExsdnBHQmNG?=
 =?utf-8?B?NjZmZVJPTlpwMEkyR2VLbU92cmZ1cGZPTmlPSGducEhPWVdiWDZBS3lPWjIz?=
 =?utf-8?B?ZkJJOUwyMGJFTUJrYnEvVTdOUDJ6bnVyR3hybVJFRXM1NENGNUVrOGo5NlJt?=
 =?utf-8?B?S2JkWmJ6elhJdENFb1IvRDZLVmpJR0l0ODlLdkdjUmhwM3ZwRzVyc0VBcFdJ?=
 =?utf-8?B?VVh1TXJGMjJEWldNa050TFJjTDZBTThUVzhvRldLZGNMOXIzS2wxZTZsbHJZ?=
 =?utf-8?B?SDFzakxGQU02eDdxVVBnZmpxNGRYWWp2bHRHNUVrLzFLZHdUbFVjOHdhU1BC?=
 =?utf-8?B?N3F2V25IcERhdVJMK240MllMcmxKZklXRTRadlllZFNxMWZXdE5IOHdNMitT?=
 =?utf-8?B?T0FGUkF1T1NQdW1LVHJwZFdwbnlIV2RFY0UyTEV1WDNMZFJRRFlSK0N2Tjkx?=
 =?utf-8?B?Tng4dHV1QktvSXVockRMbDJkWGdPN3gwekthWmQ4TTB6c0ZuYkFVY0Q3Rlg0?=
 =?utf-8?B?Zk9GMzFnb012b0RNN1BJTjFMNWdPeXpLZ2RWNGxkajJKc0p2cHdjeWdIZk9G?=
 =?utf-8?B?ZGxxWmNyeWpEdVJxMThwR281Mm1ZU3M3UWlmcUYybWwweXF2V29SSThrYzZo?=
 =?utf-8?B?cDVoVkxVaFVUb2E3TW9leE0rYlRGT2svaHhwdVpOZ3FsK1FkZi9OOEt0ZFcw?=
 =?utf-8?B?TGdJZnRmcUg4Qkdqc05DelpKbEUvc1pnQjI3VHNFeFVjQ1VXNW5mVm8vK2x6?=
 =?utf-8?B?d1hQZDl5NXdkbkFnaVR3RkN1NC82U0tjMkc5UVN6QjVrL2ZzOFRlVkxZT2tI?=
 =?utf-8?B?UW1KSFhoaTMvVjQySGxrMjA3SGhGK29Sb01YT0xYRlQvY0ZuMHg3RlJCbHl2?=
 =?utf-8?B?dkFTRndPS215aDlDankwSVNtaWlnTmIzT3FyM20xVWZmcHN5TVZxMi9NdzM1?=
 =?utf-8?B?VTVJVHRhVHI0QVJyWHVvZ1pZdDZJbW5EVzBJeFZHSzZjR2hSNzdvb1ZKbWhR?=
 =?utf-8?B?Wmx5UGxQTWpETXJKS0FWbDRNYzl3bUJxZk8vdGVBYUlqcTF1eWtOcWp4eFpq?=
 =?utf-8?B?ejdmN1pXaVdobDQ3MHYxYzREUzl5TEk4VGE0Yi80eW9zTWNFcEY3K1RVQ0lr?=
 =?utf-8?B?RlBOZ0xmL3ZDYkRjbUhwenFYY1Y5bDJxUWk2VUhBZml0K2VLelNtMC9VV0tX?=
 =?utf-8?B?UGhUcHhxZ2VSSTcwd1hObE5tWWs3S3lZb2g4WkZ0ZGZRYi9JcU0xU1hVaEI5?=
 =?utf-8?B?M2tBNG9BQzlESm5jVkYvOEx6Z0Z6TjNtSjVnTkE5RkJ3d0cwZnI5L216ZjFH?=
 =?utf-8?B?alAvUUR5M2UyQktDOGRYM08wcGthTmYreEc4WDlZQ1RVNU5UUDBSR3FDNXJi?=
 =?utf-8?B?NEcyUjZYMWs2SnVpNHZzMnVZRTZqa2Y0STFYa0xsK1Nma0JZYmd2R2NreGdI?=
 =?utf-8?B?eExzY096NTNVbHNoTEMzczJXVGZCWWhlSStGZStmTGdRdjlNaXVUR2dRZDBC?=
 =?utf-8?B?UHYrVEkveFZTbWQ3M08wbEo0bmhCenpDZnFySU4yV1d3NGpFeXZpdkVHckg2?=
 =?utf-8?B?bDFCQ3dJTUszSUlTV3daUXo2UW9TZ2lqQklubEtzaTg3RUZqZStmeWF2Qzdn?=
 =?utf-8?B?cWZiUkZ3YVNmelJzZWpRekxUNFVtZ0lUTkVvT2UrSHJKRXFQajRlNmlhOGpi?=
 =?utf-8?B?YWhoV04yNjdYUHZ2bmVzeGcvUm5CUnFFWTM4T2VacU9aTnVZZzhXMS9ETUxY?=
 =?utf-8?B?UDMyT3pqdCtHellTYzBxZHU0R0VReU5XTGxKa0gzQmlEcmovMVFVcVBlclJq?=
 =?utf-8?B?UDJWNmJXaFRTajJUY3FpSTdtNHpUaHZWc0dQNFNlbERKOXVDRkhlRklsakV0?=
 =?utf-8?B?NjZwRVY0aUU4amx4TmhvZkowRkZtVUdvcHdESWFIVHNlVHZRRmRRekZaVy9L?=
 =?utf-8?B?aGl5dzBZQWk2RitTWHF1ajY3OEhkYlFBODRqbkpFdlBmTys4WVdhQ1daQkpj?=
 =?utf-8?B?RFhFclNQQ0t0dE1YYWRMa2RNYkVHcUdJZzhQVUdxRGF6SVVXZVh1SjdGQVdz?=
 =?utf-8?B?Q2xOYW4wZy91K2JaN3NxVy8yeWJsMSs0c0hXQkRCTnc5U0ZSWFFGVXpBcVFi?=
 =?utf-8?Q?9dHPrixubuO6kAyi0QDxxN8JhWs5it7GzNsD/D+hSl6FR?=
X-MS-Exchange-AntiSpam-MessageData-1: enY7LRD6w1nYrA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8d21972-3a61-4f2f-f330-08dec0b70222
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 14:55:38.6859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebFfxKrydU5gE48AOih/4uFx1hDCmixLsz3+kRb+na/+1s0NHHVZlzhKRFVANuEDcPYzFrbkccel4J5uNrmvBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6272

On Tue Jun 2, 2026 at 8:42 PM JST, Eliot Courtney wrote:
> On Tue Jun 2, 2026 at 12:21 PM JST, John Hubbard wrote:
>> Add external memory (EMEM) read/write operations to the GPU's FSP falcon
>> engine. These operations use Falcon PIO (Programmed I/O) to communicate
>> with the FSP through indirect memory access.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>
>
>> +impl Falcon<Fsp> {
>> +    /// Writes `data` to FSP external memory at byte `offset`.
>> +    ///
>> +    /// `data` is interpreted as little-endian 32-bit words. Returns `E=
INVAL`
>> +    /// if `offset` or the `data` length is not 4-byte aligned.
>> +    #[expect(dead_code)]
>> +    fn write_emem(&mut self, bar: &Bar0, offset: u32, data: &[u8]) -> R=
esult {
>> +        if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        let mut emem =3D Emem::new(bar);
>> +        emem.begin_write(offset as usize)?;
>> +        for chunk in data.chunks_exact(4) {
>> +            emem.write_next(u32::from_le_bytes([chunk[0], chunk[1], chu=
nk[2], chunk[3]]));
>> +        }
>> +
>> +        Ok(())
>> +    }
>> +
>> +    /// Reads FSP external memory at byte `offset` into `data`.
>> +    ///
>> +    /// `data` is stored as little-endian 32-bit words. Returns `EINVAL=
` if
>> +    /// `offset` or the `data` length is not 4-byte aligned.
>> +    #[expect(dead_code)]
>> +    fn read_emem(&mut self, bar: &Bar0, offset: u32, data: &mut [u8]) -=
> Result {
>> +        if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        let mut emem =3D Emem::new(bar);
>> +        emem.begin_read(offset as usize)?;
>> +        for chunk in data.chunks_exact_mut(4) {
>> +            chunk.copy_from_slice(&emem.read_next().to_le_bytes());
>> +        }
>> +
>> +        Ok(())
>> +    }
>> +}
>
> Both `write_emem` and `read_emem` are only ever called with `offset` as
> zero. I checked openrm, and it looks like there aren't ever writes or
> reads that don't start at zero. So we could simplify the code by
> removing `offset` and starting from zero if we will never use a non-zero
> offset (given we have auto-increment). This also lets us remove
> `EMEM_MAX_SIZE` and some `Result`s.

IIUC the way FSP communication works is that EMEM is (in theory) divided
into 8 channels. Only one message or reply is ever processed at a given
time (i.e. this is not a ring buffer), so the only values valid for
`offset` are that start address of each channels.

So while we might need to have some sort of pseudo-offset in the future,
a freeform one is definitely not adequate for EMEM and for the time
being we are only working with channel 0 anyway. Thus I agree that it
makes sense to remove it altogether for now.
