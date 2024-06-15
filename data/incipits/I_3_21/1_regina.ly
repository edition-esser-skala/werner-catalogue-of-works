\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 12/8 \tempoMarkup "[no tempo]"
    c'8 c c h g h c4 c8 r r d
    e4. d c h
    a2. g8 h d g,4 g8
    c c e gis,4 gis8 r h h c h c
    cis h cis d cis d dis cis dis e e, a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 12/8 \tempoMarkup "[no tempo]"
    s1.*5
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 12/8 \tempoMarkup "[no tempo]" \autoBeamOff
    c'8 c c h g h c4 c8 r r d
    e4. d c h
    a2. g8 h d g,4 g8
    c c e gis,4 gis8 r h h c h c
    cis h cis d cis d dis[ cis] dis e[ e,] a
  }
}

SopranoLyrics = \lyricmode {
  Re -- gi -- na coe -- li, lae -- ta -- re, lae --
  ta -- re, al -- le --
  lu -- ia, qui -- a, qui -- a
  quem me -- ru -- i -- sti, me -- ru -- i -- sti por --
  ta -- re, por -- ta -- re, por -- ta -- re, al -- "le -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 12/8 \tempoMarkup "[no tempo]" \autoBeamOff
    r4 r8 g' g g e c e g4 g8
    r g g g4 g8 r g a g4.~
    g fis g4 r8 r g d
    e4 e8 e e e e d e e4.
    e4 e8 fis4.fis4 fis8 g g e
  }
}

AltoLyrics = \lyricmode {
  Re -- gi -- na coe -- li, lae -- ta -- re,
  al -- le -- lu -- ia, al -- le -- lu --
  _ ia, qui -- a,
  qui -- a quem me -- ru -- i -- sti por -- ta --
  re, por -- ta -- re, por -- ta -- re, "al -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 12/8 \tempoMarkup "[no tempo]" \autoBeamOff
    r2*3/2 c8 c c h g h
    c4. h r8 e d d4 d8
    e[ d] e d4. d4 r8 r c h
    c4 c8 h h h h4. a4 a8
    a4. a4 h8 h4 h8 h4 a8
  }
}

TenoreLyrics = \lyricmode {
  Re -- gi -- na coe -- li, lae --
  ta -- re, al -- le -- lu -- ia,
  al -- le -- lu -- ia, qui -- a,
  qui -- a quem me -- ru -- i -- sti por --
  ta -- re, por -- ta -- re, al -- "le -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 12/8 \tempoMarkup "[no tempo]" \autoBeamOff
    r2*3/2 r4 r8 g' g g
    e c e g4 g,8 r e' fis g4 g8
    c,[ h] c d4. g,4 r8 r e' g
    c,4 c8 e e fis gis fis gis a4.
    g fis4 h,8 h'4 a8 g4 c8
  }
}

BassoLyrics = \lyricmode {
  Re -- gi -- na
  coe -- li, lae -- ta -- re, al -- le -- lu -- ia,
  al -- le -- lu -- ia, qui -- a,
  qui -- a quem me -- ru -- i -- sti por -- ta --
  _ re, por -- ta -- re, al -- "le -"
}

Organo = {
  \relative c {
    \clef soprano
    \key c \major \time 12/8 \tempoMarkup "[no tempo]"
    << { c''8 c c h4 h8 } \\ { s4. g8  g g } >> \clef tenor c, c c \clef bass g g g
    e c e g4 g,8 r e' fis g4 g8
    c, h c d4 d,8 g4. r8 e' g
    c,4 c8 r e fis gis fis gis a4.
    g fis4 h,8 h'4 a8 g4 c8
  }
}

BassFigures = \figuremode {
  r1.
  r2. r8 <6> r r4.
  <6 5> <_+>2. r8 <6>4
  r4. r8 <_+>4 r2.
  <6 4\+>4. <6> <_+> <6>4 q8
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
