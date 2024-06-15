\version "2.24.2"
\include "header.ly"

CornoDiBassettoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    R1\fermata
    \pa r2 h'
    h1\fermata \pd
    R
    R\fermata
    \pa c4.\f c8 h4. h8
    a4. a8 g4 g
  }
}

CornoDiBassettoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    R1\fermata
    a'
    a2 a4 gis\fermata
    r2 fis
    fis1\fermata
    c'4.\f c8 h4. h8
    a4. a8 g4 g
  }
}

FagottoI = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    d'1\f\fermata
    d,4 f g a
    b gis a a,\fermata
    R1
    r4 a'2 gis4\fermata
    a\f h~ h8 gis a4
    fis gis4. e8 a4
  }
}

FagottoII = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    d1\f\fermata
    R
    R\fermata
    a4 c d e
    f dis e2\fermata
    d4.\f d8 c4. c8
    h4. h8 a4 a
  }
}

CornoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    \after 2. \! c'1\f\>\fermata
    R
    R\fermata
    g1
    g2 d'\fermata
    c\f r4 g'
    r2 \pao d
  }
}

CornoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    \after 2. \! c1\f\>\fermata
    R
    R\fermata
    R
    R\fermata
    c2\f r4 g'
    r2 d'
  }
}

TromboneI = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    d'1\f\fermata
    R
    R\fermata
    R
    R\fermata
    f,4. f8 e4. e8
    d4. d8 c2
  }
}

TromboneII = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    d1\f\fermata
    R
    R\fermata
    R
    R\fermata
    a4 h~ h8 gis a4
    fis gis4. e8 a4
  }
}

TromboneIII = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    d1\f\fermata
    R
    R\fermata
    R
    R\fermata
    d4. d8 c4. c8
    h4. h8 a2
  }
}

TenoreI = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1\fermata
    r2 e4^\solo e
    e2 e\fermata
    R1
    R\fermata
    f4.\f f8 e4. e8
    d4. d8 c4 c
  }
}

TenoreILyrics = \lyricmode {
  Di -- es
  il -- la,

  te -- ste Da -- vid
  cum Si -- byl -- la,
}

TenoreII = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1\fermata
    d4^\solo d d d
    d d d cis\fermata
    r2 h4 h
    h h h h\fermata
    a4\f h h8[ gis] a4
    fis gis gis8[ e] a4
  }
}

TenoreIILyrics = \lyricmode {
  Di -- es i -- rae,
  di -- es il -- la,
  sol -- vet
  in fa -- vil -- la,
  te -- ste Da -- vid
  cum Si -- byl -- la,
}

BassoI = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1\fermata
    d4^\solo f g a
    b gis a a,\fermata
    a' a a a
    a a a gis\fermata
    r f8.\f f16 c4 a'
    r e8. e16 e4 e
  }
}

BassoILyrics = \lyricmode {
  Di -- es i -- rae,
  di -- es il -- la,
  sol -- vet sae -- clum
  in fa -- vil -- la,
  te -- ste Da -- vid
  cum Si -- byl -- la,
}

BassoII = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1\fermata
    R
    R\fermata
    a4^\solo c! d e
    f dis e e,\fermata
    d'4.\f d8 c4. c8
    h4. h8 a4 a
  }
}

BassoIILyrics = \lyricmode {
  Di -- es i -- rae,
  di -- es il -- la,
  te -- ste Da -- vid
  cum Si -- byl -- la,
}

\score {
  <<
    \new StaffGroup \with { \setGroupDistance #15 #15 } <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "cor di" "bassetto 1, 2" }
        \set Staff.soloText = \markup \remark \medium "cdb 1"
        \set Staff.soloIIText = \markup \remark \medium "cdb 2"
        \partCombine #'(0 . 10) \CornoDiBassettoI \CornoDiBassettoII
      >>
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "fag" "1, 2" }
        \set Staff.soloText = \markup \remark \medium "fag 1"
            \set Staff.soloIIText = \markup \remark \medium "fag 2"
        \partCombine #'(0 . 10) \FagottoI \FagottoII
      >>
    >>
    \new StaffGroup <<
      \new Staff <<
        \set Staff.instrumentName = \markup \center-column { "cor" "1, 2" }
        \set Staff.soloText = \markup \remark \medium "cor 1"
        \partCombine #'(0 . 10) \CornoI \CornoII
      >>
      \new GrandStaff <<
        \new Staff {
          \set Staff.instrumentName = \markup \center-column { "trb" "1" }
          \TromboneI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \TromboneII
        }
        \new Staff {
          \set Staff.instrumentName = "3"
          \TromboneIII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "T 1"
        \new Voice = "TenoreI" { \dynamicUp \TenoreI }
      }
      \new Lyrics \lyricsto TenoreI \TenoreILyrics

      \new Staff {
        \set Staff.instrumentName = "T 2"
        \new Voice = "TenoreII" { \dynamicUp \TenoreII }
      }
      \new Lyrics \lyricsto TenoreII \TenoreIILyrics

      \new Staff {
        \set Staff.instrumentName = "B 1"
        \new Voice = "BassoI" { \dynamicUp \BassoI }
      }
      \new Lyrics \lyricsto BassoI \BassoILyrics

      \new Staff {
        \set Staff.instrumentName = "B 2"
        \new Voice = "BassoII" { \dynamicUp \BassoII }
      }
      \new Lyrics \lyricsto BassoII \BassoIILyrics
    >>
  >>
}
