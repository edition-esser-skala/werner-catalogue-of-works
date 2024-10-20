\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    r16 c' e g c g e c r g h d g d h g
    r c, e g c g e c \tuplet 3/2 8 { a'\trill g a } r8 \tuplet 3/2 8 { \sbOn a16\trill g a d\trill c d \sbOff }
    h g h d g d h g e g c e g, c d ,h'
    c g c e g e c a gis8 \tuplet 3/2 8 { \sbOn h16\trill a h cis\trill h \hA cis e\trill d e }
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    r16 c' e g c g e c r g h d g d h g
    r c, e g c g e c \tuplet 3/2 8 { a'\trill g a } r8 \tuplet 3/2 8 { \sbOn a16\trill g a d\trill c d \sbOff }
    h g h d g d h g e g c e g, c d ,h'
    c g c e g e c a gis8 \tuplet 3/2 8 { \sbOn h16\trill a h cis\trill h \hA cis e\trill d e }
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    c'8^\tutti c c8. c16 h8 d d d
    e e c4. c8 r d
    d d r d e e d4
    e8 e4 e8 e e, cis' cis
  }
}

SopranoLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no
  me -- o: Se -- de a
  dex -- tris, a dex -- tris me --
  is, do -- nec po -- nam in -- "i -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    g'8^\tutti g g8. g16 g8 g g g
    g g r g[ a] a r fis
    g2 g4 g
    g r8 c16 a gis8 h e, a
  }
}

AltoLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no
  me -- o: Se -- de a
  dex -- tris me --
  is, do -- nec po -- nam in -- "i -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    e8^\tutti e e8. e16 d8 d h h
    c c e[ g] c,4 fis8[ a]
    d, g, h d c4. h8
    c4 a8 c h h a a
  }
}

TenoreLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no
  me -- o: Se -- de, se --
  de a dex -- tris me -- _
  is, do -- nec po -- nam in -- "i -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    c'8^\tutti c, c e16 c g'8 g4 g,8
    c c r4 f d
    g r8 h c c, g4
    c a'8 a e e a a,
  }
}

BassoLyrics = \lyricmode {
  Di -- xit Do -- mi -- nus Do -- mi -- no
  me -- o: Se -- _
  de a dex -- tris me --
  is, do -- nec po -- nam in -- "i -"
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Vivace"
    c4-\tutti r16 c e c g' d h g r g' h g
    c g e c r c e c f c a f d'' a fis d
    g d h g r g' h g c g e c g'8 g,
    c4 r16 e a c e h gis e a e cis a
  }
}

BassFigures = \figuremode {
  r1
  r2. <_+>4
  r2. <4>8 <3>
  r2 <_+>4 q
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
